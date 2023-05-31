class ChangePricesTypeInCar < ActiveRecord::Migration[7.0]
  def change
    change_column(:cars, :price_per_hour, :float)
    change_column(:cars, :price_per_kilometer, :float)
  end
end
