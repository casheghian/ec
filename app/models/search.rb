class Search < ActiveRecord::Base
  attr_accessible :cuisine_input, :keywords, :offer_input

def restaurants
  @restaurants ||= find_restaurants
end

private

def find_restaurants
  restaurants = Restaurant.order(:id) 
  restaurants = restaurants.where("name like ?", "%#{keywords}%") if keywords.present?
  restaurants = restaurants.tagged_with("#{cuisine_input}") if cuisine_input.present?
  restaurants = restaurants.tagged_with("#{offer_input}")  if offer_input != 'true'

  restaurants


end


end
