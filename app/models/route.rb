class Route < ApplicationRecord
  belongs_to :start_point, class_name: 'Point'
  belongs_to :end_point, class_name: 'Point'
end
