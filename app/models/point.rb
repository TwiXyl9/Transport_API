class Point < ApplicationRecord
  has_many :start_point, class_name: 'Route', foreign_key: 'start_point_id'
  has_many :end_point, class_name: 'Route', foreign_key: 'end_point_id'
  validates :latitude, :longitude, :address, presence: true
end


