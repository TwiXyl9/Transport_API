class OrderAdditionalServiceSerializer < ActiveModel::Serializer
  attributes :id, :amount, :additional_service
  belongs_to :order
  belongs_to :additional_service
end
