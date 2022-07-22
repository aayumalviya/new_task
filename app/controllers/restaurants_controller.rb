class RestaurantsController < ApplicationController
  def index 
    @restaurants = Restaurant.all
  end 

  def show 
    @restaurant = Restaurant.find(params[:id])
  end 

  def new 
    @restaurant = Restaurant.new
    2.times{ @menu = @restaurant.menus.new }
  end 


  def create 
    @restaurant = Restaurant.create(restaurant_params)
    
    # if @restaurant.save 
    #   redirect_to root_path
    # else 
    #   render :new 
    # end 
  end 

  def edit 
    @restaurant = Restaurant.find(params[:id])
  end 

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else 
      render :edit 
    end 
  end 

  def destroy 
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy 
      redirect_to root_path

  end 

  private 
  def restaurant_params 
    params.require(:restaurant).permit(:restaurant_name , menus_attributes: [:id, :menu_name, :_destroy])
  end 

end
