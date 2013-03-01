class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :cuisine_id
      t.string :offer_50
      t.string :offer_241

      t.timestamps
    end
  end
end
