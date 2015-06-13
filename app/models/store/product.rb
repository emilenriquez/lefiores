class Store::Product
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :store, :class_name => 'Store' 
  has_one :store, :class_name => 'Store' 
  
  #field :views, :type => Integer, :default => 0
  field :price, :type => String
  field :name, :type => String
  field :product_id, :type => String
  field :product_category_id, :type => String
  field :description, :type => String
  field :store_id  , type: String
  field :colors  , type: Array
  field :status  , type: Symbol, :default => :active

  #field :product_category
  has_many :store_product_images, :class_name => 'Store::Product::Image'
  belongs_to :store_product_category, :class_name => 'Store::Product::Category'
  has_one :store_product_category, :class_name => 'Store::Product::Category'
  #validates :postal_code, presence: true
  validates :name, presence: true
  validates :product_category_id, presence: true
  validates_uniqueness_of :product_id, :message => 'Item Id must be unique.'



  mount_uploader :pic, ProductUploader

  def category
    @category = Store::Product::Category.where(:id => self.product_category_id).first;
  end

  def store
    Store.where(:id => self.store_id).first
  end
  
  #has_and_belongs_to_many :fav_users, :class_name => 'User'
  #has_and_belongs_to_many :recent_topic_pages, :class_name => 'Topic::Page'
  #has_many :recent_topic_pages, :class_name => 'Topic::Page'
  #has_and_belongs_to_many :hot_topic_pages, :class_name => 'Topic::Page'
  
end
