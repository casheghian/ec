class Search < ActiveRecord::Base
  attr_accessible :cuisine_input, :keywords, :offer_input,

def restaurants
  @restaurants ||= find_restaurants
end

private
	def find_restaurants
	  restaurants = Restaurant.order(:id) 
	  restaurants = restaurants.where("name like ?", "%#{keywords}%") unless keywords.blank?
	  restaurants = restaurants.tagged_with(params[:cuisine], :any => true) unless cuisine[].blank?
	  #restaurants = restaurants.tagged_with("#{offer_input.join(",")}",:any => true)  unless offer_input.blank?
	 # restaurants = restaurantsUser.tagged_with(['awesome, cool'], :on => :tags, :any => true).tagged_with(['smart', 'shy'], :on => :skills, :any => true)

	  restaurants
	end
end
