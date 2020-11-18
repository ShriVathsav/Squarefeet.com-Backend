class CreateFurnishings < ActiveRecord::Migration[6.0]
  def change
    create_table :furnishings do |t|
      t.integer "name", null: false
      t.integer "quantity", null: false
      t.boolean "active", null: false
      t.timestamps
    end
  end
end
