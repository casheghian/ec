class Search < ActiveRecord::Base
  attr_accessible :cuisine_input, :keywords, :offer_input

def restaurants
  @restaurants ||= find_restaurants
end

private
	def find_restaurants
	  restaurants = Restaurant.order(:id) 
	  restaurants = restaurants.where("name like ?", "%#{keywords}%") unless keywords.blank?
	  restaurants = restaurants.tagged_with("#{cuisine_input}") unless cuisine_input.blank?
	  restaurants = restaurants.tagged_with("#{offer_input}")  unless offer_input.blank?
	  restaurants
	end
end
