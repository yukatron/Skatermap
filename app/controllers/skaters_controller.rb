class SkatersController < ApplicationController
  before_action :authenticate_skater!, except: [:index]

  def show
    @skater = Skater.find(params[:id])
  	@posts = @skater.posts.page(params[:page]).reverse_order
  end

  def index
    @skaters = Skater.all
  end

  def edit
  	@skater = Skater.find(params[:id])
  end

  def update
    @skater = Skater.find(params[:id])
    if params[:remove_profile_image]
      image = @skater.profile_image
      image.destroy
    end
    if @skater.update(skater_params)
      flash[:notice]= "プロフィールを更新しました"
      redirect_to skater_path(@skater)
    else
      :edit
    end
  end


  private
  def skater_params
    params.require(:skater).permit(:name, :profile_image, :remove_profile_image)
  end
end
