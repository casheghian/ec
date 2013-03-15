class Restaurant < ActiveRecord::Base
  attr_accessible :name, :content, :sub_content, :cuisine_list, :offer_list, :availability_list, :max_party_list, :tag_list, :address, :city, :district, :zip, :longitude, :latitude, :image
  has_many :images
  acts_as_taggable
  acts_as_taggable_on :cuisine, :offer, :availability, :max_party, :tag
  acts_as_gmappable :process_geocoding => false
  mount_uploader :image, ImageUploader

  include PgSearch
  pg_search_scope :search_query, against: [:name, :address, :city, :district, :zip],
  using: {tsearch: {dictionary: "english"}}


  def gmaps4rails_address
    "#{self.longitude}, #{self.latitude}" 
  end
   
  def gmaps4rails_infowindow
	"<h4>#{self.name}</h4>
   <p>Cuisine:#{self.cuisine_list}</br>
   Offer:#{self.offer_list}</br>
   Availability:#{self.availability_list}</p>"  
  end

  def gmaps4rails_marker_picture
    {
    "picture" => '/assets/marker.png', # image_path column has to contain something like '/assets/my_pic.jpg'.
    "width" => 25, #beware to resize your pictures properly
    "height" => 39, #beware to resize your pictures properly
    }
  end

end


	