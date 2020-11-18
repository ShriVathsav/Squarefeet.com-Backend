class AddRelation < ActiveRecord::Migration[6.0]
  def change
    add_reference :properties, :profile, foreign_key: true
    add_reference :amenities, :property, foreign_key: true
    add_reference :other_rooms, :property, foreign_key: true
    add_reference :furnishings, :property, foreign_key: true
    add_reference :photos, :property, foreign_key: true
  end
end
