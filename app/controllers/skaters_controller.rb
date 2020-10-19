class SkatersController < ApplicationController
  def show
  	@skater = Skater.find(params[:id])
  end

  def edit
  	@skater = Skater.find(params[:id])
  end
end
