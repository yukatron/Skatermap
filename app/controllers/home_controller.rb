class HomeController < ApplicationController
  def top
  	@skaters = Skater.all
  	@parks = Park.all
  	@posts = Post.all
  end

  def about
  end
end
