class CreateTailTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :tail_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
