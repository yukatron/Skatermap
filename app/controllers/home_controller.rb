class HomeController < ApplicationController

  def top
  	@skaters = Skater.all
  	@parks = Park.all
  	@posts = Post.all.page(params[:page]).reverse_order.per(4)
  end

  def about
  end
end
