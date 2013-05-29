class AddClientIdToSubscriptions < ActiveRecord::Migration
  def change
  add_column :subscriptions, :client_id, :string

  end
end
