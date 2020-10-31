class FavoritesController < ApplicationController
	before_action :authenticate_skater!
	before_action :ensure_current_skater

	def create
		post = Post.find_by(title: params[:post_title])
		favorite = current_skater.favorites.new
		favorite.post_id = post.id
		favorite.save
		redirect_to post_path(post)
	end

	def destroy
		post = Post.find_by(title: params[:post_title])
		favorite = current_skater.favorites.find_by(post_id: post.id)
		favorite.destroy
		redirect_to post_path(post)
	end
end
