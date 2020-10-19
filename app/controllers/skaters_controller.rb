class SkatersController < ApplicationController
  def show
  	if params[:post_id]
  		@skater = Skater.find_by(id: params[:skater_id])
  	else
  		@skater = Skater.find(params[:id])
  	end
  	@posts = @skater.posts.page(params[:page]).reverse_order
  end

  def edit
  	@skater = Skater.find(params[:id])
  end
end
