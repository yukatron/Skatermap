class ApplicationController < ActionController::Base

	def ensure_current_skater
	    if admin_signed_in?
	    	flash[:notice]="アクセス権がありません"
	    	redirect_to root_path
      elsif current_skater.is_deleted == true
  	    flash[:notice]="このアカウントは無効です"
  	    redirect_to root_path
	    end
  end

  	#退会済みアカウント
    def skater_is_deleted
      if skater_signed_in? && current_skater.is_deleted?
      	flash[:notice] = "このアカウントは無効です"
        redirect_to root_path
      end
    end
end
