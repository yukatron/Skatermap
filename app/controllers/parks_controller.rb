class ParksController < ApplicationController

	def new
		@park = Park.new
		@country = Country.new
	end

	def create
		@park = Park.new(park_params)

			if params[:_country] == "exist"
				@country = Country.find(params[:Country][:id])
			elsif params[:_country] == "new"
				@country = Country.new(country_params)
				@country.save
			end

		@park.country_id = @country.id

		if @park.save
			redirect_to park_path(@park.id)
		else
			@country = Country.new
			render :new
		end
	end

	def index
		@parks = Park.all.page(params[:page]).reverse_order
	end

	def show
		@park = Park.find(params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
		@park = Park.find(params[:id])
		@park.destroy
		redirect_to parks_path
	end

	private

	def park_params
		params.require(:park).permit(:name, :address, :zip, images: [], country:[:name])
	end

	def country_params
		params.require(:country).permit(:name)
	end
end
