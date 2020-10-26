class Admin::CommentsController < ApplicationController
	before_action :authenticate_admin!

	def destroy
		Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
		redirect_to admin_posts_path
	end
end
