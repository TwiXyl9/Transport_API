class CreateCapacities < ActiveRecord::Migration[7.0]
  def change
    create_table :capacities do |t|
      t.float :width
      t.float :height
      t.float :length
      t.integer :num_of_pallets

      t.timestamps
    end
  end
end
