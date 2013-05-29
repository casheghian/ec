class AddAddressFieldsToSubscription < ActiveRecord::Migration
  def change
  	  add_column :subscriptions, :address, :string
  	  add_column :subscriptions, :city, :string
  	  add_column :subscriptions, :zip, :string
  end
end
