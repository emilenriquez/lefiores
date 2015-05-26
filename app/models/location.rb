class Location
  require 'csv'
  include Mongoid::Document
  include Mongoid::Timestamps
  #field :name, type: String
  field :zipcode, type: String
  field :delivery_fee, type: String, default: 0
  field :delivery_areas, type: Array
  field :keywords, type: String
  field :name, type: String
  #field :city, type:Object
  #field :state, type:Object
  

  field :state_id, type: String
  field :city_id, type: String
  # def state
  #    Location::State.where(:id=>self.state_id).first
  # end
  
  field :status, type: String , default: 'active'      
  

  #has_many :keywords, :class_name => 'Location::Keyword'
  #has_many :images, :class_name => 'Store:key => "value", :Image'
  #has_one :state, :class => 'Location::State'
  #has_many :location_state, :class_name => 'Location::State'

  has_and_belongs_to_many :location_city, :class_name => 'Location::City'
  has_and_belongs_to_many :store_branch, :class_name => 'Store::Branch'
  has_one :location_state, :class_name => 'Location::State'  

  after_find :set_city_and_state
  def set_city_and_state
   # self.city = Location::City.where(:id => self.city_id.to_s).first    
   # self.state = Location::State.where(:id => self.state_id.to_s).first    
  end

  def city
    Location::City.where(:id => self.city_id.to_s).first    
  end
  def state
    Location::State.where(:id => self.state_id.to_s).first    
  end

  def self.import(file)        
    CSV.foreach(file.path, :headers => true , :encoding => 'ISO-8859-1') do |csv|
      @location = Location.new

      
      #city
      @city = City.new
      @city.name = csv[1]
      @duplicate_city = City.where(:name => @city.name).first
      if @duplicate_city.blank?
        @location.city_id = @city.id.to_s
        @city.save    
      else
        @location.city_id = @duplicate_city.id.to_s  
      end  

      #state
      @state = State.new

      @state.name = csv[2]
      @duplicate_state = State.where(:name => @state.name).first
      if @duplicate_state.blank?
        @location.state_id = @state.id.to_s
        @state.save      
      else
        @location.state_id = @duplicate_state.id.to_s  
      end  


      #location
      
      @location.name = csv[0] + ', ' + @city.name + ' ' +@state.name
      @location.zipcode = csv[0]
      @location.location_city = Location::City.all.first    
      @location.location_state = State.where(:id => @location.state_id.to_s).first    
      @location.save      
    end
  end
  
end
