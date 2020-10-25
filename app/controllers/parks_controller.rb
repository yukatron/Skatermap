class ParksController < ApplicationController
	before_action :authenticate_skater!, except: [:index]
	before_action :set_park, only: [:show, :edit, :update, :destroy]

	def new
		@park = Park.new
		@country = Country.new
	end

	def create
		@park = Park.new(park_params)

		if params[:_country] == "exist"
			country = Country.find(params[:Country][:id])
		elsif params[:_country] == "new"
			country = Country.new(country_params)
			country.save
		end
		@park.country_id = country.id

		if @park.save
			redirect_to park_path(@park.id)
		else
			@country = Country.new
			render :new
		end
	end

	def index
		@parks = Park.page(params[:page]).reverse_order
		@search_params = park_search_params
		@parks = Park.search(@search_params).page(params[:page]).reverse_order
	end

	def show
		@posts = @park.posts.page(params[:page]).reverse_order
	end

	def edit
		@country = @park.country
	end

	def update
		if params[:park][:image_ids]
			params[:park][:image_ids].each do |image_id|
				image = @park.images.find(image_id)
				image.purge
			end
		end

		if params[:_country] == "exist"
			country = Country.find(params[:Country][:id])
		elsif params[:_country] == "new"
			country = Country.new(country_params)
			country.save
		end
		@park.country_id = country.id

		if @park.update(park_params)
			flash[:notice]="パーク情報を更新しました"
			redirect_to park_path(@park)
		else
			render :edit
		end
	end

	def destroy
		@park.destroy
		redirect_to parks_path
	end

	private

	def park_params
		params.require(:park).permit(:name, :address, :zip, :tel, :price, :open_time, :description, images: [])
	end

	def park_search_params
		params.fetch(:search, {}).permit(:name)
	end

	def country_params
		params.require(:country).permit(:name)
	end

	def set_park
		@park = Park.find_by(name: params[:name])
	end
end
