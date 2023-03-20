class Capacity < ApplicationRecord
  has_one :car
  validates :width, :height, :length, :num_of_pallets, presence: true, uniqueness: true
end
