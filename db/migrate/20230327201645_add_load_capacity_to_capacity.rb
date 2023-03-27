class AddLoadCapacityToCapacity < ActiveRecord::Migration[7.0]
  def change
    add_column :capacities, :load_capacity, :float
  end
end
