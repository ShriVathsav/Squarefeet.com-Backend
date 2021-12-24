# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_21_134614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.integer "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "property_id"
    t.index ["property_id"], name: "index_amenities_on_property_id"
  end

  create_table "furnishings", force: :cascade do |t|
    t.integer "name", null: false
    t.integer "quantity", null: false
    t.boolean "active", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "property_id"
    t.index ["property_id"], name: "index_furnishings_on_property_id"
  end

  create_table "other_rooms", force: :cascade do |t|
    t.integer "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "property_id"
    t.index ["property_id"], name: "index_other_rooms_on_property_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "path", default: "", null: false
    t.string "tag", default: "", null: false
    t.boolean "cover_photo", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "property_id"
    t.index ["property_id"], name: "index_photos_on_property_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "contact_no", default: "", null: false
    t.string "email", default: "", null: false
    t.string "last_name", default: "", null: false
    t.integer "properties_posted", default: 0
    t.integer "properties_sold", default: 0
    t.string "company_name"
    t.string "company_address"
    t.string "designation", default: "Owner", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "properties", force: :cascade do |t|
    t.string "property_type", default: "", null: false
    t.string "sub_property_type"
    t.string "poster_designation", default: "", null: false
    t.string "list_property_for", default: "", null: false
    t.string "location"
    t.string "locality", default: "", null: false
    t.string "city", default: "", null: false
    t.string "landmark"
    t.string "street"
    t.string "door_no"
    t.string "project_name"
    t.float "super_builtup_area"
    t.float "plot_area"
    t.float "carpet_area"
    t.float "builtup_area"
    t.float "undivided_share"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "balconies"
    t.string "furnishing"
    t.string "total_floors"
    t.string "property_on_floor"
    t.integer "floors_allowed_for_construction"
    t.integer "number_of_flats"
    t.boolean "presence_of_elevator", default: false
    t.boolean "reserved_parking", default: false
    t.integer "closed_parking", default: 0
    t.integer "open_parking", default: 0
    t.string "availability"
    t.string "property_age"
    t.string "possession_by"
    t.string "ownership", default: "", null: false
    t.bigint "price", default: 0
    t.bigint "booking_advance", default: 0, null: false
    t.bigint "maintenance"
    t.bigint "expected_rental"
    t.bigint "rent"
    t.bigint "security_deposit"
    t.boolean "all_prices_inclusive", default: false
    t.boolean "price_negotiable", default: false
    t.float "brokerage"
    t.string "water_source", default: "", null: false
    t.string "overlooking", default: "", null: false
    t.bigint "capacity_of_water_storage"
    t.boolean "corner_property", default: false
    t.boolean "gated_society", default: false
    t.string "facing", default: "", null: false
    t.float "width_of_facing_road", null: false
    t.string "flooring_type"
    t.string "power_backup"
    t.text "property_description", default: "", null: false
    t.string "posting_status", default: "Active", null: false
    t.integer "open_sides"
    t.string "width_of_facing_road_unit"
    t.boolean "rent_negotiable"
    t.boolean "brokerage_negotiable"
    t.boolean "two_wheeler_parking"
    t.boolean "boundary_wall"
    t.integer "transaction_type"
    t.string "sub_locality"
    t.string "address"
    t.string "geographic_coordinates"
    t.string "postal_code"
    t.string "state"
    t.string "maintenance_unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "profile_id"
    t.string "photos_list"
    t.string "amenities_list"
    t.string "more_amenities_list"
    t.string "other_rooms_list"
    t.string "furnishings_list"
    t.index ["profile_id"], name: "index_properties_on_profile_id"
  end

  add_foreign_key "amenities", "properties"
  add_foreign_key "furnishings", "properties"
  add_foreign_key "other_rooms", "properties"
  add_foreign_key "photos", "properties"
  add_foreign_key "properties", "profiles"
end
