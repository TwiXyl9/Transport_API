class Point < ApplicationRecord
  validates :latitude, :longitude, :address, presence: true, uniqueness: true
end


