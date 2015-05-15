class Store::Product
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :store, :class_name => 'Store' 
   
  
  #field :views, :type => Integer, :default => 0
  field :price, :type => String
  field :name, :type => String
  field :product_id, :type => String
  field :description, :type => String
  field :store_id  , type: String
  field :colors  , type: Array
  
  #field :product_category
  has_many :store_product_images, :class_name => 'Store::Product::Image'
  
  #validates :postal_code, presence: true
  validates :name, presence: true


  mount_uploader :pic, ProductUploader
  
  #has_and_belongs_to_many :fav_users, :class_name => 'User'
  #has_and_belongs_to_many :recent_topic_pages, :class_name => 'Topic::Page'
  #has_many :recent_topic_pages, :class_name => 'Topic::Page'
  #has_and_belongs_to_many :hot_topic_pages, :class_name => 'Topic::Page'
  
end
