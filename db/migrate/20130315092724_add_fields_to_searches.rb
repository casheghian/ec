class AddFieldsToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :availability_input, :string
    add_column :searches, :max_party_input, :string
  end
end
