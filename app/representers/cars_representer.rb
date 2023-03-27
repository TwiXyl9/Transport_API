class CarsRepresenter
  include Rails.application.routes.url_helpers
  attr_reader :cars

  def initialize(cars)
    @cars = cars
  end

  def to_json
    @cars.map do |car|
      CarRepresenter.new(car).to_json
    end
  end
end
