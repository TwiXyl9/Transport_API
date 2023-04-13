class RouteSerializer < ActiveModel::Serializer
  attributes :id, :start_point, :end_point
  belongs_to :start_point, class_name: 'Point'
  belongs_to :end_point, class_name: 'Point'
end
