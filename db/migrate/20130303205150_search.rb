class Search < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :cuisine_input
      t.string :offer_input
     

      t.timestamps
    end
  end
end
