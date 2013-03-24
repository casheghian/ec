class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
    	t.integer  "cuisine_id"
    	t.integer  "restaurant_id"
      t.timestamps
    end
  end
end
