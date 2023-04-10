class CarRepresenter
  include Rails.application.routes.url_helpers
  attr_reader :car

  def initialize(car)
    @car = car
  end

  def to_json
    {
      'car': {
        id: @car.id,
        brand: @car.brand,
        model: @car.model,
        price: @car.price,
        images: @car.images_url,
        capacity_id: @car.capacity.id,
        width: @car.capacity.width,
        height: @car.capacity.height,
        length: @car.capacity.length,
        num_of_pallets: @car.capacity.num_of_pallets,
        load_capacity: @car.capacity.load_capacity,
        tail_type_id: @car.tail_type.id,
        tail_type: @car.tail_type.name
      }
    }
  end
end