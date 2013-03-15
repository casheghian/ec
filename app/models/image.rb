class Image < ActiveRecord::Base
  attr_accessible :restaurant_id, :name, :image, :remote_image_url
  belongs_to :restaurant
  mount_uploader :image, ImageUploader
end
