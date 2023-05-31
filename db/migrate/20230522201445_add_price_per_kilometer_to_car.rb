class AddPricePerKilometerToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :price_per_kilometer, :integer
  end
end
