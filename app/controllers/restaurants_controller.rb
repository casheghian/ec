class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants.json
  before_filter :authorize, only: [:edit, :update]

  def index
  if params[:cuisine]
    @restaurants = Restaurant.joins(:cuisines).where(:cuisines => {:name => params[:cuisine]})
  else
    @restaurants = Restaurant.all
    @json = Restaurant.all

  end
end
  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant }
    end
  end


  # GET /restaurants/new
  # GET /restaurants/new.json
  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end

  def filter
        @restaurants = Restaurant.joins(:cuisines).where(:cuisines => {:name => params[:cuisine]})
        length = 0
    @json = @restaurants.to_gmaps4rails do |restaurant, marker|
    length += 1
    marker.picture({
                        :rich_marker => "<div class='my-marker' id='#{restaurant.id}'><a href='/restaurants/#{restaurant.to_param}'>#{length}</a></div>",
                        :marker_anchor=>[10,true]
                        
        })
    marker.json({ :id => restaurant.id })
      end 
  end
end
