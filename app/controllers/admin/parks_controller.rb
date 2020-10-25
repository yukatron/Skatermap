class Admin::ParksController < ApplicationController
	before_action :authenticate_admin!
  def edit
  	@park = Park.find(params[:id])
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

  def index
  	@parks = Park.page(params[:page]).per(6).reverse_order
  end

  private
  def park_params
	params.require(:park).permit(:name, :address, :zip, :tel, :price, :open_time, :description, images: [])
  end
end
