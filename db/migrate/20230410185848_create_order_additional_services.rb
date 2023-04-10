class CreateOrderAdditionalServices < ActiveRecord::Migration[7.0]
  def change
    create_table :order_additional_services do |t|
      t.references :order, index: true, foreign_key: true
      t.references :additional_service, index: true, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
