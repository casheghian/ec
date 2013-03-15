class AddColumnToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :restaurant_id, :integer
  end
end
