class DropTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :other_rooms
    drop_table :furnishings
    drop_table :amenities
    drop_table :photos
  end
end
