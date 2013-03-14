class Restaurant < ActiveRecord::Base
  attr_accessible :content, :cuisine_list, :name, :offer_list, :opening_hours, :restriction_list, :tag_list, :sub_content, :title, :address, :longitude, :latitude
  acts_as_taggable
  acts_as_taggable_on :cuisine, :offer, :restriction, :tag
  acts_as_gmappable :process_geocoding => false

def gmaps4rails_address
  "#{self.longitude}, #{self.latitude}" 
end
   
def gmaps4rails_infowindow
	"<h4>#{self.name}</h4>
  <p>Cuisine:#{self.cuisine_list}</br>
  Offer:#{self.offer_list}</br>
  Restrictions:</p>"  
end

def gmaps4rails_marker_picture
    {
    "picture" => '/assets/marker.png', # image_path column has to contain something like '/assets/my_pic.jpg'.
    "width" => 25, #beware to resize your pictures properly
    "height" => 39, #beware to resize your pictures properly
    }
end

end


	