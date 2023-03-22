class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.references :start_point
      t.references :end_point
      t.timestamps
    end
    add_foreign_key :routes, :points, column: :start_point_id, primary_key: :id
    add_foreign_key :routes, :points, column: :end_point_id, primary_key: :id
  end
end
