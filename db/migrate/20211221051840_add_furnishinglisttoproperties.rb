class AddFurnishinglisttoproperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :furnishings_list, :string
  end
end
