class Store
  include Mongoid::Document
  include Mongoid::Timestamps
  field :img_url, type: String
  field :name, type: String
  field :business_reg_no, type: String
  field :contact_no, type: String
  field :page_url, type: String
  field :user_id, type: Object
  field :user_email, type: String
  field :has_branch, type: Boolean , default: false  
  field :current_branch_id, type: Object  
  field :store_logo_url, type: String 
  field :store_logo_id, type: Object 

  has_many :branches, :class_name => 'Store::Branch'
  has_many :store_images, :class_name => 'Store::Image'
  has_many :products, :class_name => 'Store::Product'
  #has_many :images, :class_name => 'Store:key => "value", :Image'
  belongs_to :user

  validates :business_reg_no, uniqueness: true
  validates :page_url, uniqueness: true  
  
  def branches
     Store::Branch.where(:store_id => self.id)
  end  
end
