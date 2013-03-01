class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :restaurants
  # attr_accessible :title, :body
end
