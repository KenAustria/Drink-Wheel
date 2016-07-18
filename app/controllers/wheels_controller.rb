class WheelsController < ApplicationController
	def index
		@wheel = Wheel.order("RANDOM()").limit(1).first
	end

	def spin
		puts(params) #create spin event Events::Spin.create(user_id: params[:id], .......)
		head :ok
	end
end