class Admin::DrinksController < Admin::BaseController
  def index
  	@drinks = Drink.order("name asc")
  end

  def show
    @drink = Drink.find(params[:id])
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

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    @drink = Drink.find(params[:id])
    if @drink.update_attributes(params[:drink])
      redirect_to admin_drink_path(@drink)
    else
      render :edit
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    redirect_to admin_drinks_path
  end
end
