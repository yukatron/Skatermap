class Admin::ParksController < ApplicationController
	before_action :authenticate_admin!

  def edit
  	@park = Park.find(params[:id])
  	@country = Country.new
  end

  def update
  	@park = Park.find(params[:id])
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
	else
		country = @park.country
	end

	@park.country_id = country.id

	if @park.update(park_params)
		flash[:notice]="パーク情報を更新しました"
		redirect_to admin_parks_path
	else
		render :edit
	end
  end

  def index
  	if params[:country_id]
  		@parks = Park.where(country_id: params[:country_id]).page(params[:page]).per(6).reverse_order
  	else
  		@parks = Park.page(params[:page]).per(6).reverse_order
  	end
  end

  def destroy
  	park = Park.find(params[:id])
  	park.destroy
  	redirect_to admin_parks_path
  end

  private
  def country_params
	params.require(:country).permit(:name)
  end

  def park_params
	params.require(:park).permit(:name, :address, :zip, :tel, :price, :open_time, :description, images: [])
  end
end
