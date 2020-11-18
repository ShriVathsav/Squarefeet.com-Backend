class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string "property_type", default: "", null: false
      t.integer "sub_property_type"
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
      t.integer "total_floors"
      t.integer "property_on_floor"
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
      t.timestamps
    end
  end
end
