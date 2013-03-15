class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.string   "image"
    t.timestamps
    end
  end
end
