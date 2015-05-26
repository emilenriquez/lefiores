class Location::City
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  #field :views, :type => Integer, :default => 0
  field :name, :type => String  
  field :status, type: String , default: 'active'  
  field :location_id, type:String

  has_and_belongs_to_many :location, :class_name => 'Location'  
  
end 
