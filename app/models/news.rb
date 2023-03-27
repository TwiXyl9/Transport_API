class News < ApplicationRecord
  has_one_attached :image, :dependent => :destroy
  validates :title, :description, presence: true
  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
