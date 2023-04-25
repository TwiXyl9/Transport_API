class Order < ApplicationRecord
  belongs_to :car
  belongs_to :route, dependent: :destroy
  belongs_to :cargo_type
  has_many :order_additional_services, dependent: :destroy
  has_many :additional_services, :through => :order_additional_services

  validates :phone, :name, :date, :total_price, presence: true

  enum stage: [:Создан, :Подтвержден, :Отклонен, :Завершен]
  after_initialize :set_default_stage, :if => :new_record?

  def order_additional_services_attributes=(array)
    array.each do |item|
      order_additional_services.build(item)
    end
  end

  private
  def set_default_stage
    self.stage ||= :created
  end
end
