class Admin::CountriesController < ApplicationController
	before_action :authenticate_admin!

  def index
  	@countries = Country.all
  end

  def edit
  	@country = Country.find(params[:id])
  end

  def update
  	@country = Country.find(params[:id])
  	if @country.update(country_params)
  		flash[:notice]="国情報を変更しました"
  		redirect_to admin_countries_path
  	else
  		render :edit
  	end
  end

  def destroy
  	country = Country.find(params[:id])
  	country.destroy
  	redirect_to admin_countries_path
  end

  private
  def country_params
  	params.require(:country).permit(:name, :description)
  end
end
