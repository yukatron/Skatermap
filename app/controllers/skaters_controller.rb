class SkatersController < ApplicationController
  before_action :authenticate_skater!, except: [:index]
  before_action :skater_is_deleted
  before_action :set_skater, only: [:show, :edit, :update, :withdraw]
  before_action :set_current_skater, only: [:edit, :withdraw]

  def show
  	@posts = @skater.posts.page(params[:page]).reverse_order
  end

  def index
    @skaters = Skater.all
    @search_params = skater_search_params
    @skaters = Skater.search(@search_params).page(params[:page]).reverse_order
  end

  def edit
  end

  def update
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

  def withdraw
    @skater.update(is_deleted: true)
    reset_session
    flash[:notice] ="アカウントを削除しました"
    redirect_to root_path
  end

  private
  def skater_params
    params.require(:skater).permit(:name, :biography, :profile_image, :remove_profile_image)
  end

  def skater_search_params
    params.fetch(:search, {}).permit(:name)
  end

  def set_skater
    @skater = Skater.find_by(name: params[:name])
  end

end
