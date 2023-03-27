class Car < ApplicationRecord
  belongs_to :capacity, dependent: :destroy
  belongs_to :tail_type
  has_many_attached :images, :dependent => :destroy

  validates :brand, :model, presence: true

  def images_url
    images.map{|img| Rails.application.routes.url_helpers.url_for(img)}
  end
end
