Rails.application.routes.draw do
  resources :listings
  resources :reviews
  resources :photos
  resources :portfolios
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
