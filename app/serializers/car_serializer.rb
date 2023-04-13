class CarSerializer < ActiveModel::Serializer
  attributes :id, :brand, :model, :price, :images_url, :capacity, :tail_type
  belongs_to :capacity
  belongs_to :tail_type
  def images_url
    object.images.map{|img| Rails.application.routes.url_helpers.url_for(img)}
  end
end
