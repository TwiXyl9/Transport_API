class AddDescriptionToAdditionalService < ActiveRecord::Migration[7.0]
  def change
    add_column :additional_services, :description, :string
  end
end
