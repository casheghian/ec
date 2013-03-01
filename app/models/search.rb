class Search < ActiveRecord::Base
  attr_accessible :cuisine_id, :keywords, :offer_241, :offer_50


def restaurants
  @restaurants ||= find_restaurants
end

private

def find_restaurants
  restaurants = Restaurant.order(:name)
  restaurants = restaurants.where("name like ?", "%#{keywords}%") if keywords.present?
  

  restaurants
end


end
