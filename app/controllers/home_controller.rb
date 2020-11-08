class HomeController < ApplicationController

  def top
  	@parks = Park.order("created_at DESC").first(5)
  	@posts = Post.order("updated_at DESC").first(4)
  end

  def about
  end
end
