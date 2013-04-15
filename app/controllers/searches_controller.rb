class SearchesController < ApplicationController



def index
  @search = Search.all
end

def new
  @search = Search.new
	
	#@json = Restaurant.all.to_gmaps4rails do |restaurant, marker|
	#marker.json({ :id => restaurant.id })
 	#end
 
end

def create
 	@search = Search.create!(params[:search])

	 respond_to do |format|
   format.html { redirect_to @search}  
   end
end

def update
 	@search = Search.create!(params[:search])
  
	 respond_to do |format|
   format.html { redirect_to @search}
   
   format.js { 
    @json = @search.restaurants.to_gmaps4rails do |restaurant, marker| 
      marker.json({ :id => restaurant.id })
 		end 
 		 }
  end
end

 def show
    @search = Search.find(params[:id])
    @json = @search.restaurants.to_gmaps4rails do |restaurant, marker|
  	marker.json({ :id => restaurant.id })
 			end 
  end
end
