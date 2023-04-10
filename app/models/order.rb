class Order < ApplicationRecord
  belongs_to :car, dependent: :destroy
  belongs_to :route
  belongs_to :cargo_type
  has_many :order_additional_services
  has_many :additional_services, :through => :order_additional_services, :source => :additional_services

  validates :phone, :name, :date, presence: true

  enum stage: [:created, :confirmed, :rejected, :completed, :archival]
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
