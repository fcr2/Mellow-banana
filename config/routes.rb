Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
root to: 'statics#index', as: 'home'

  get '/about' => 'statics#about', as: 'about'
  get 'settings/index'
  devise_for :models
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# root to: "peliculas#index"
resources :peliculas
resources :settings


end
