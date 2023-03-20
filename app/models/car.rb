class Car < ApplicationRecord
  belongs_to :capacity, dependent: :destroy
  # belongs_to :tail_type
  validates :brand, :model, presence: true, uniqueness: true
end
