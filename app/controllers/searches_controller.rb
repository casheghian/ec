class SearchesController < ApplicationController

def new
  @search = Search.new

  @json = Restaurant.all.to_gmaps4rails do |restaurant, marker|
  marker.json({ :id => restaurant.id })
 end
 
 end

def create
  @search = Search.create!(params[:search]) 

end


end
