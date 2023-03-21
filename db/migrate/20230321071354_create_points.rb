class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps
    end
  end
end
