class PingsController < ApplicationController
	before_action :set_ping, only: [:show, :edit, :update, :destroy]

	def index
		@pings = Ping.all
	end

	def new
		@ping = Ping.new
	end
	
	def create
		if @ping = Ping.create(ping_params)
			redirect_to pings_path
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @ping.update(ping_params)
			redirect_to pings_path
		else
			render :edit
		end
	end

	def destroy
		@ping.destroy
		redirect_to root_path
	end

	private

	def ping_params
		params.require(:ping).permit(:image, :caption)
	end

	def set_ping
    @ping = Ping.find(params[:id])
  end
end
