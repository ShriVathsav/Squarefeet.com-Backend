class AddRelation < ActiveRecord::Migration[6.0]
  def change
    add_reference :properties, :profile, foreign_key: true
  end
end
