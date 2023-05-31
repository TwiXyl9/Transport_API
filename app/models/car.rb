class Car < ApplicationRecord
  belongs_to :capacity, dependent: :destroy
  belongs_to :tail_type
  has_many :orders, dependent: :destroy
  has_many_attached :images, dependent: :destroy

  validates :brand, :model, :price_per_hour, :price_per_kilometer, presence: true

end
