class FixPriceInCar < ActiveRecord::Migration[7.0]
  def change
    rename_column :cars, :price, :price_per_hour
  end
end
