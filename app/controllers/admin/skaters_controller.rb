class Admin::SkatersController < ApplicationController
	before_action :authenticate_admin!

  def index
  	@skaters = Skater.page(params[:page]).per(10).reverse_order
  end

  def edit
  	@skater = Skater.find(params[:id])
  end

  def update
  	@skater = Skater.find(params[:id])
  	if @skater.update(skater_params)
  		flash[:notice]= "スケーター情報を変更しました"
  		redirect_to admin_skaters_path
  	else
  		render :edit
  	end
  end

  private
  def skater_params
  	params.require(:skater).permit(:name, :biography, :profile_image, :remove_profile_image, :is_deleted)
  end
end
