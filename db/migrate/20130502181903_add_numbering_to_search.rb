class AddNumberingToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :number, :integer
  end
end
