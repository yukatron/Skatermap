class FavoritesController < ApplicationController
	before_action :authenticate_skater!
	before_action :ensure_current_skater

	def create
		@post = Post.find_by(title: params[:post_title])
		favorite = current_skater.favorites.build(post_id: @post.id)
		favorite.save
	end

	def destroy
		@post = Post.find_by(title: params[:post_title])
		favorite = Favorite.find_by(post_id: @post.id, skater_id: current_skater.id)
		favorite.destroy
	end
end
