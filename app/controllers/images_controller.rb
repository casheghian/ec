class ImagesController < ApplicationController
  
  def new
    @image = Image.new(:restaurant_id => params[:restaurant_id])
  end

  def create
    @image = Image.new(params[:image])
    if @image.save
      flash[:notice] = "Successfully created image."
      redirect_to @image.restaurant
    else
      render :action => 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      flash[:notice] = "Successfully updated image."
      redirect_to @image.restaurant
    else
      render :action => 'edit'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Successfully destroyed image."
    redirect_to @image.restaurant
  end
end


