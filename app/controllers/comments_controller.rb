class CommentsController < ApplicationController
	before_action :authenticate_skater!
	before_action :ensure_current_skater, except:[:destroy]

	def create
		post = Post.find_by(title: params[:post_title])
		comment = current_skater.comments.new(comment_params)
		comment.post_id = post.id
		comment.save
		redirect_to post_path(post)
	end

	def destroy
		comment = Comment.find(params[:id])
		post = comment.post
		comment.destroy
		redirect_to post_path(post)
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end

end
