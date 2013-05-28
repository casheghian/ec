class Member < ActiveRecord::Base
  attr_accessible :address, :city, :email, :name, :zip
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :zip
end
