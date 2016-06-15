class Admin::WheelsController < Admin::BaseController
  def index
  	@wheels = Wheel.order("name asc")
  end

  def show
    @wheel = Wheel.find(params[:id])
  end

  def new
  	@wheel = Wheel.new
  end

  def create
  	@wheel = Wheel.new(params[:wheel]) 
  	if @wheel.save	
  	  redirect_to admin_wheels_path	
  	else
  	  render :new	
  	end
  end	

  def edit
    @wheel = Wheel.find(params[:id])
  end

  def update
    @wheel = Wheel.find(params[:id])
    if @wheel.update_attributes(params[:wheel])
      redirect_to admin_wheel_path(@wheel)
    else
      render :edit
    end
  end

  def destroy
    @wheel = Wheel.find(params[:id])
    @wheel.destroy
    redirect_to admin_wheels_path
  end
end
