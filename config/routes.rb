Rails.application.routes.draw do
  # get 'offer/index'
  # get 'offer/create'
  # get 'offer/new'
  # get 'offer/edit'
  # get 'offer/show'
  # get 'offer/update'
  # get 'offer/destroy'

  root :to => 'listings#landing'
  get '/listings/:id/apply' => 'listings#apply', as: 'apply_listing'
  # post '/listings/:id/apply' => 'listings#submitoffer', as: 'submit_offer_listing'
  patch '/listings/:id/revise_offer_listing' => 'offers#edit', as: 'revise_offer_listing'
  # patch '/listings/:id/revise_offer_listing' => 'offers#edit', as: '/listings/:id/revise_offer_listing'
  resources :listings do
    resources :offer
  end
  resources :reviews
  resources :photos
  resources :portfolios
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
