Rails.application.routes.draw do
  get 'statics/index'

  get 'statics/about'

  devise_for :models
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "peliculas#index"
# resources :peliculas
end
