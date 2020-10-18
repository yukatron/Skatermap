Rails.application.routes.draw do

  	root 'home#top'
  	get 'home/about' => 'home#about', as: :about

	devise_for :skaters, controllers: {
		registrations: 'skaters/registrations',
		sessions: 'skaters/sessions'
	}

  	resources :skaters, only: [:show, :edit, :update]

	devise_for :admins, skip: :all
	devise_scope :admin do
		get 'admin/sign_in' => 'admin/sessions#new', as: :new_admin_session
		post 'admin/sign_in' => 'admin/sessions#create', as: :admin_session
		delete 'admin/sign_out' => 'admin/sessions#destroy', as: :destroy_admin_session
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
