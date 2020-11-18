class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string "path", default: "", null: false
      t.string "tag", default: "", null: false
      t.boolean "cover_photo", default: false, null: false
      t.timestamps
    end
  end
end
