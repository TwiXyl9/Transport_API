class AdditionalService < ApplicationRecord
  has_many :order_additional_services, dependent: :destroy
  has_many :orders, :through => :order_additional_services
  validates :name, presence: true, uniqueness: {
    message: ->(object, data) do
      "Услуга с таким названием уже существует!"
    end
  }
  validates :price, presence: true
end
