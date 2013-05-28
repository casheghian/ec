class CreateCustomers < ActiveRecord::Migration
    def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :zip
      t.timestamps
   end
 end
end
