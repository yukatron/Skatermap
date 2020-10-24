class CountriesController < ApplicationController
  before_action :authenticate_skater!, except: [:show, :index]
	before_action :set_country, only: [:edit, :update, :show, :destroy]

  def new
  	@country = Country.new
  end

  def create
  	@country = Country.new(country_params)
  	if @country.save
  		flash[:notice]= "新しく国情報を保存しました"
  		redirect_to countries_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @country.update(country_params)
  		redirect_to country_path(@country)
  	else
  		render :edit
  	end
  end

  def show
  	@parks = @country.parks.page(params[:page]).reverse_order
  end

  def index
  	@countries = Country.page(params[:page]).reverse_order
  	@search_params = country_search_params
  	@countries = Country.search(@search_params).page(params[:page]).reverse_order
  end

  def destroy
  	@country.destroy
  	redirect_to countries_path
  end

  private
  def country_params
  	params.require(:country).permit(:name, :description)
  end

  def country_search_params
  	params.fetch(:search, {}).permit(:name)
  end

  def set_country
  	@country = Country.find(params[:id])
  end
end
