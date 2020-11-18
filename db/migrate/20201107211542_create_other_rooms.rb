class CreateOtherRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :other_rooms do |t|
      t.integer "name", null: false
      t.timestamps
    end
  end
end
