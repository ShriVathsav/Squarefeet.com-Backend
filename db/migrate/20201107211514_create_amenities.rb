class CreateAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :amenities do |t|
      t.integer "name", null: false
      t.timestamps
    end
  end
end
