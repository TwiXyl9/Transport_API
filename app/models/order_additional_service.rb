class OrderAdditionalService < ApplicationRecord
  belongs_to :order
  belongs_to :additional_service
end
