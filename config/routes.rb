Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root :to => 'listings#landing'
  
  get 'home/index'
  # get 'offer/index'
  # get 'offer/create'
  # get 'offer/new'
  # get 'offer/edit'
  # get 'offer/show'
  # get 'offer/update'
  # get 'offer/destroy'

  get '/listings/:id/apply' => 'listings#apply', as: 'apply_listing'
  # post '/listings/:id/apply' => 'listings#submitoffer', as: 'submit_offer_listing'
  patch '/listings/:id/revise_offer_listing' => 'offers#edit', as: 'revise_offer_listing'
  # patch '/listings/:id/revise_offer_listing' => 'offers#edit', as: '/listings/:id/revise_offer_listing'
  resources :listings do
    resources :offer
  end
  resources :portfolios do
    resources :reviews
    resources :photos
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
