class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all.page(params[:page]).reverse_order
	end

	def show
		skater = Skater.find_by(id: @post.skater_id)
		@posts = skater.posts.page(params[:page]).reverse_order
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.skater_id = current_skater.id
		if params[:park_id].present?
			@post.park_id = params[:park_id]
		end
		if @post.save
			flash[:notice] = "投稿成功しました"
			redirect_to post_path(@post.id)
		else
			@parks = Park.all
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice]= "動画を編集しました"
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def destroy
	end

	private
	def set_post
		@post = Post.find(params[:id])
	end
	def post_params
		params.require(:post).permit(:title, :caption, :video)
	end
end
