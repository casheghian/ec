class Restaurant < ActiveRecord::Base
  attr_accessible :content, :cuisine_list, :name, :offer_list, :opening_hours, :restrictions, :sub_content, :title, :address, :longitude, :latitude
  acts_as_taggable
  acts_as_taggable_on :cuisine, :offer
  acts_as_gmappable :process_geocoding => false

def gmaps4rails_address
  "#{self.longitude}, #{self.latitude}" 
end
   
def gmaps4rails_infowindow
	"#{self.name},#{self.content}"
end


end


	