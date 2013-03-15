class Search < ActiveRecord::Base
  attr_accessible :cuisine_input, :keywords, :offer_input, :availability_input, :max_party_input

  

def restaurants
  @restaurants ||= find_restaurants
end

private
	def find_restaurants
	  restaurants = Restaurant.order(:id) 
	  restaurants = restaurants.search_query(keywords) unless keywords.blank?

	  #restaurants = restaurants.where("name ilike ?", "%#{keywords}%") unless keywords.blank?
	  restaurants = restaurants.tagged_with(cuisine_input, :any => true) unless cuisine_input.blank?
	  restaurants = restaurants.tagged_with(offer_input, :any => true)  unless offer_input.blank?
	 #restaurants = restaurantsUser.tagged_with(['awesome, cool'], :on => :tags, :any => true).tagged_with(['smart', 'shy'], :on => :skills, :any => true)

	  restaurants
	end
end
