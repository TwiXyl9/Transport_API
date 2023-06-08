class AddPlaceIdToPoint < ActiveRecord::Migration[7.0]
  def change
    add_column :points, :placeId, :string
  end
end
