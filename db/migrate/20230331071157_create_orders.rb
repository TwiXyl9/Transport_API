class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :phone
      t.string :name
      t.datetime :date
      t.integer :stage
      t.references :car, null: false, foreign_key: true
      t.references :route, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.references :cargo_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
