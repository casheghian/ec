class EditColumnsOnRestaurant < ActiveRecord::Migration
  
  def change

  	remove_column :restaurants, :restrictions
end


  
end
