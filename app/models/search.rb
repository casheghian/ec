class Search < ActiveRecord::Base
  attr_accessible :keywords, :cuisine_input, :offer_input, :availability_input, :max_party_input
  serialize :cuisine_input
  serialize :offer_input
  serialize :availability_input

 
  def to_param
  	"#{id}-#{keywords}-#{cuisine_input}-#{offer_input}-#{availability_input}-#{max_party_input}".parameterize
  end

  def restaurants
  	@restaurants ||= find_restaurants
  end

private
	def find_restaurants
	  restaurants = Restaurant.order(:id).joins(:cuisines).select("distinct(restaurants.id), restaurants.*")
	  #restaurants = Restaurant.order(:id).joins(:cuisines)
	  restaurants = restaurants.where("restaurants.name @@ :q or zip @@ :q or city @@ :q or district @@ :q or keywords @@ :q or cuisines.name @@ :q", q: keywords) if keywords.present?
	  restaurants = restaurants.where("cuisines.name in (?)", cuisine_input) unless cuisine_input.blank?
	  restaurants = restaurants.where("offer in (?)", offer_input) unless offer_input.blank?
	  restaurants = restaurants.where("availability in (?)", availability_input) unless availability_input.blank?
	  restaurants = restaurants.where("max_party >= ?", max_party_input) unless max_party_input.blank?


	  #restaurants = restaurants.tagged_with(offer_input,:on => :offer, :any => true)  unless offer_input.blank?
	  #restaurants = restaurants.tagged_with(availability_input, :any => true)  unless availability_input.blank?
	  #restaurants = restaurants.tagged_with(max_party_input, :any => true)  unless max_party_input.blank?

	  restaurants
	
	end
end
