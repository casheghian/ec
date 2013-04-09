class Search < ActiveRecord::Base
  attr_accessible :keywords, :cuisine_input, :offer_input, :availability_input, :max_party_input

  def restaurants
  	@restaurants ||= find_restaurants
  end

private
	def find_restaurants
	  restaurants = Restaurant.order(:id) 
	  restaurants = Restaurant.joins(:cuisines).where(:cuisines => {:name => cuisine_input}) unless cuisine_input.blank?
	  restaurants = restaurants.tagged_with(offer_input, :any => true)  unless offer_input.blank?
	  restaurants = restaurants.tagged_with(availability_input, :any => true)  unless availability_input.blank?
	  restaurants = restaurants.tagged_with(max_party_input, :any => true)  unless max_party_input.blank?
	  restaurants = restaurants.search_query(keywords) unless keywords.blank?

	  restaurants
	
	end
end
