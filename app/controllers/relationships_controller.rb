class RelationshipsController < ApplicationController
	before_action :authenticate_skater!
	before_action :set_skater, except: [:index]

	def create
	    following = current_skater.follow(@skater)
		if following.save
		else
		    flash[:notice] = 'フォローに失敗しました'
		    redirect_to skater_path(@skater)
		end
  	end

  	def index
  		@skater = Skater.find_by(id: params[:skater_id])
  		@followings = @skater.followings
  	end

  	def destroy
	    following = current_skater.unfollow(@skater)
		if following.destroy
		else
		    flash[:notice] = 'unfollowに失敗しました'
		    redirect_to skater_path(@skater)
		end
  	end

	private
	def set_skater
		@skater = Skater.find(params[:id])
	end
end
