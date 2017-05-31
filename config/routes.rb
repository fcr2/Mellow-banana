Rails.application.routes.draw do
root to: 'statics#index', as: 'home'

  get '/about' => 'statics#about', as: 'about'
  
  devise_for :models
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# root to: "peliculas#index"
resources :peliculas
end
