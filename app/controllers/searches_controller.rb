class SearchesController < ApplicationController
def new
  @search = Search.new
end

def create
  @search = Search.create!(params[:search])
  redirect_to @search
end

def show
  @search = Search.find(params[:id])
  @json = @search.restaurants.all.to_gmaps4rails

    
end


end
