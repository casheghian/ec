class Restaurant < ActiveRecord::Base
  attr_accessible :name, :content, :sub_content, :keywords, :tags, :cuisine_ids, :offer, :availability, :max_party, 
                  :address, :city, :district, :zip, :phone_number, :longitude, :latitude, :image
  
  has_many :images
  has_many :categorizations
  has_many :cuisines, through: :categorizations
  
  acts_as_gmappable :process_geocoding => false
  
  mount_uploader :image, ImageUploader


  def to_param
    "#{id}-#{name}".parameterize
  end
  
  def gmaps4rails_address
    "#{self.longitude}, #{self.latitude}" 
  end
   

end


	