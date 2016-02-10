class DrinksController < ApplicationController
  def index
  	@drinks = Drink.order("name asc")
  end

  def show
    @drink = Drink.find(params[:id])
  end
end 
