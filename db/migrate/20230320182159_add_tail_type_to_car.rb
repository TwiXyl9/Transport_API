class AddTailTypeToCar < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :tail_type, null: false, foreign_key: true
  end
end
