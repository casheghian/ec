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
  length = 0
    @json = @search.restaurants.to_gmaps4rails do |restaurant, marker|
    length += 1
    marker.picture({
                        :rich_marker => "<div class='my-marker'><a href='<%= link_to restaurant.id, restaurant_path(restaurant) %>'>#{length}</a></div>",
                        :marker_anchor=>[10,true]
                        
        })
    marker.json({ :id => restaurant.id })
  	end 
 		 }
  end
end

 def show
    @search = Search.find(params[:id])
    length = 0
    @json = @search.restaurants.to_gmaps4rails do |restaurant, marker|
    length += 1
    marker.picture({
                        :rich_marker => "<div class='my-marker'><a href='/restaurants/#{restaurant.to_param}'>#{length}</a></div>",
                        :marker_anchor=>[10,true]
                        
        })
  	marker.json({ :id => restaurant.id })
 			end 
  end
end
