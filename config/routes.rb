Rails.application.routes.draw do

  	root 'home#top'
  	get 'about' => 'home#about', as: :about

	devise_for :skaters, controllers: {
		registrations: 'skaters/registrations',
		sessions: 'skaters/sessions',
    passwords: 'skaters/passwords'
	}

  	resources :skaters, param: :name, only: [:show, :edit, :update, :index] do
  		get 'following' => 'relationships#index',as: :followings
  	end
      get 'skaters/:name/delete' => 'skaters#withdraw', as: :delete_account
  	resources :posts, param: :title do
  		resources :comments, only: [:create, :destroy]
  		resource :favorites, only: [:create, :destroy]
  	end
  	resources :parks, param: :name
    resources :countries, param: :name


  	post 'follow/:id' => 'relationships#create', as: :follow
  	delete 'unfollow/:id' => 'relationships#destroy', as: :unfollow

	devise_for :admins, skip: :all
	devise_scope :admin do
		get 'admin/sign_in' => 'admin/sessions#new', as: :new_admin_session
		post 'admin/sign_in' => 'admin/sessions#create', as: :admin_session
		delete 'admin/sign_out' => 'admin/sessions#destroy', as: :destroy_admin_session
	end

  namespace :admin do
    resources :skaters, param: :id, only: [:index, :edit, :update]
    resources :parks, param: :id, only: [:edit, :update, :destroy, :index]
    resources :posts, param: :id, only: [:index, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :countries, param: :id, only: [:index, :edit, :update, :destroy]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
