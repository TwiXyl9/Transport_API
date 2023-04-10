class Capacity < ApplicationRecord
  has_one :car, dependent: :destroy
  validates :width, :height, :length, :num_of_pallets, :load_capacity, presence: true
end
