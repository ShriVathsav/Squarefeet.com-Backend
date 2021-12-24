class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string "first_name"
      t.string "password_digest"
      t.string "contact_no", default: "", null: false
      t.string "email", default: "", null: false
      t.string "last_name", default: "", null: false
      t.integer "properties_posted", default: 0
      t.integer "properties_sold", default: 0
      t.string "company_name"
      t.string "company_address"
      t.string "designation", default: "Owner", null: false
      t.timestamps
    end
  end
end
