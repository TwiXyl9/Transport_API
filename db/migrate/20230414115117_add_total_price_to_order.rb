class AddTotalPriceToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :total_price, :integer
  end
end
