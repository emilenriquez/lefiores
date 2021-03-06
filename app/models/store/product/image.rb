class Store::Product::Image
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :Product 

  mount_uploader :file, ProductUploader
  before_create :set_url

  field :file, type: String
  field :url, type: String
  #field :news_id, type: String
  field :store_id, type: Object
  field :product_id, type: Object
  index({ store_id: 1 }, {  name: "page_id_index"})
  index({ product_id: 1 }, {  name: "product_id_index"})

  field :user_id, type: Object
  field :ip, type: String

  def set_url
    url = self.file.url
  end

end
