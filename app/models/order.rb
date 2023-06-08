class Order < ApplicationRecord
  belongs_to :car
  belongs_to :route, dependent: :destroy
  belongs_to :cargo_type
  has_many :order_additional_services, dependent: :destroy
  has_many :additional_services, :through => :order_additional_services, dependent: :destroy

  validates :phone, :name, :date, :total_price, presence: true

  enum stage: [:Создан, :Подтвержден, :Отклонен, :Выполнен]
  after_initialize :set_default_stage

  def order_additional_services_attributes=(array)
    array.each do |item|
      order_additional_service = order_additional_services.find_or_initialize_by(id: item[:id])
      order_additional_service.update!(item)
    end
  end

  private
  def set_default_stage
    self.stage ||= :Создан
  end
end
