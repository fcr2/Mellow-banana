Rails.application.routes.draw do

  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  ActiveAdmin.routes(self)

  
  get '/about' => 'statics#about', as: 'about'
  get 'settings/index'

  devise_for :models
  
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# root to: "peliculas#index"
  resources :peliculas
  resources :settings

  root to: 'statics#index', as: 'home'

end
