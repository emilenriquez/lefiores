class Store::Branch
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :store, :class_name => 'Store' 
   
  
  #field :views, :type => Integer, :default => 0
  field :contact_no, :type => String, :default => ''
  field :postal_code, :type => String
  #this field is store name + branch name ex: petalika_main or petalika_solaris
  field :sub_name, :type => String    
  field :store_id  , type: String
  #field :cut_off_time, type: DateTime, default: ->{ 10.minutes.ago }
  field :cut_off_time, type: String
  field :business_hours_summary, type: String
  #Afield :delivery_areas, type: Array
  

  #has_many :delivery_areas, :class_name  => 'Location'
  has_and_belongs_to_many :delivery_areas, :class_name => 'Location'
  #has_many :location_state, 

  #business hours
  field :business_hours_from_monday, type: String
  field :business_hours_from_tuesday, type: String
  field :business_hours_from_wednesday, type: String
  field :business_hours_from_thursday, type: String
  field :business_hours_from_friday, type: String
  field :business_hours_from_saturday, type: String
  field :business_hours_from_sunday, type: String

  field :business_hours_to_monday, type: String
  field :business_hours_to_tuesday, type: String
  field :business_hours_to_wednesday, type: String
  field :business_hours_to_thursday, type: String
  field :business_hours_to_friday, type: String
  field :business_hours_to_saturday, type: String
  field :business_hours_to_sunday, type: String

  
  #validates :postal_code, presence: true
  validates :sub_name, presence: true

  def store
    Store.where(:id => self.store_id).first
  end
  
  #has_and_belongs_to_many :fav_users, :class_name => 'User'
  #has_and_belongs_to_many :recent_topic_pages, :class_name => 'Topic::Page'
  #has_many :recent_topic_pages, :class_name => 'Topic::Page'
  #has_and_belongs_to_many :hot_topic_pages, :class_name => 'Topic::Page'
  
end
