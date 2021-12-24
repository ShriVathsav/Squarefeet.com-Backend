class Changecolumntypes < ActiveRecord::Migration[6.0]
  def change
    change_column :properties, :sub_property_type, :string
    change_column :properties, :total_floors, :string
    change_column :properties, :property_on_floor, :string

  end
end
