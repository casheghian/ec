class Restaurant < ActiveRecord::Base
  attr_accessible :content, :cuisine_list, :name, :offer_list, :opening_hours, :restrictions, :sub_content, :title, :address, :longitude, :latitude
  acts_as_taggable
  acts_as_taggable_on :cuisine, :offer

end
