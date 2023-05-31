class AdditionalServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :image_url
  def image_url
    Rails.application.routes.url_helpers.url_for(object.image) if object.image.attached?
  end
end
