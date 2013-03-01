class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :title
      t.text :content
      t.text :sub_content
      t.string :cuisine
      t.string :offer
      t.text :opening_hours
      t.string :restrictions

      t.timestamps
    end
  end
end
