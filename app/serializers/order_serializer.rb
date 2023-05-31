class OrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :date, :stage, :total_price, :user_id, :created_at
  belongs_to :car
  belongs_to :route
  belongs_to :cargo_type
  has_many :order_additional_services
  #has_many :additional_services, :through => :order_additional_services
  def date
    object.date.strftime("%d.%m.%Y, %H:%M")
  end
end
