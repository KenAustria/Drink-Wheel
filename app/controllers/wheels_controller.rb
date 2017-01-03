class WheelsController < ApplicationController
	def index
		@wheel = Wheel.order("RANDOM()").limit(1).first
	end

	def spin
		puts(params) #create spin event Events::Spin.create(user_id: params[:id], .......)
		head :ok
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
      flash[:notice] = "Wheel successfully created!"  
      redirect_to wheels_path 
    else
      render :new 
    end
  end 

  def edit
    @wheel = Wheel.find(params[:id])
    if @wheel.save
      redirect_to wheels_path
    else
      render :new
    end
  end

  def update
    @wheel = Wheel.find(params[:id])
    if @wheel.update_attributes(params[:wheel])
      redirect_to wheel_path(@wheel)
    else
      render :edit
    end
  end

  def destroy
    @wheel = Wheel.find(params[:id])
    @wheel.destroy
    redirect_to wheels_path
  end
end