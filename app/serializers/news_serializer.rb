class NewsSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image_url
  def image_url
    Rails.application.routes.url_helpers.url_for(object.image) if object.image.attached?
  end
end
