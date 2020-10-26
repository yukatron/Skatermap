class Admin::PostsController < ApplicationController
	before_action :authenticate_admin!

  def index
  	if params[:skater_id]
  		@posts = Post.where(skater_id: params[:skater_id]).page(params[:page]).per(12).reverse_order
  	else
      @posts = Post.page(params[:page]).per(12).reverse_order
    end
  end

  def destroy
  	post = Post.find(params[:id])
  	if post.destroy
  		flash[:notice]="投稿を削除しました"
  		redirect_to admin_posts_path
  	else
  		@posts = Post.page(params[:page]).per(12).reverse_order
  		render :index
  	end
  end
end
