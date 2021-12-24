class AddDescriptionToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :photos_list, :string
    add_column :properties, :amenities_list, :string
    add_column :properties, :more_amenities_list, :string
    add_column :properties, :other_rooms_list, :string
  end
end
