class DrinksController < ApplicationController
  def index
  	@drinks = Drink.order("name asc")
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def search
  	@drinks = Drink.basic_search(params[:search][:name]) #redirect_to show
  end

  def spin
  	Event::Spin.create(params)
  	head :ok
  end
end  
