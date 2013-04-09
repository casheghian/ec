class Restaurant < ActiveRecord::Base
  attr_accessible :name, :content, :sub_content, :cuisine_ids, :offer_list, :availability_list, :max_party_list, :tag_list, :address, :city, :district, :zip, :phone_number, :longitude, :latitude, :image
  
  has_many :images
  has_many :categorizations
  has_many :cuisines, through: :categorizations
  
  acts_as_taggable
  acts_as_taggable_on :offer, :availability, :max_party, :tag
  acts_as_gmappable :process_geocoding => false
  
  mount_uploader :image, ImageUploader

  include PgSearch
    pg_search_scope :search_query, against: [:name, :zip, :district],
    using: {tsearch: {dictionary: "german"}},
    :associated_against => {
    :tags => [:name],
    :cuisines => [:name]
    }


  def gmaps4rails_address
    "#{self.longitude}, #{self.latitude}" 
  end
   
  def gmaps4rails_infowindow
	"<h4>#{self.name}</h4>
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


	