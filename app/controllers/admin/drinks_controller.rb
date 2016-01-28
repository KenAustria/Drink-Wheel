class Admin::DrinksController < ApplicationController
  def index
  	@drinks = Drink.order("name asc")
  end

  def new
  	@drink = Drink.new
  end

  def create
  	@drink = Drink.new(params[:drink]) # load params into a new drink object
  	if @drink.save	# if the drink saves correctly (is valid?)
  	  redirect_to admin_drinks_path	#redirect to the admin drinks index page
  	else
  	  render :new	# drink didn't save correctly, so re-render the form
  	end
  end	
end
