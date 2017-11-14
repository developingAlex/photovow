Rails.application.routes.draw do
  
  
  get 'messages/create'

    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }
    
  post 'conversations/:id/show' => 'messages#create'
  get 'conversations/index' => 'conversations#index', as: 'conversations' 
  get 'conversations/:id/show' => 'conversations#show', as: 'conversation'
  get 'conversations/new' => 'conversations#new', as: 'new_conversation'
  get 'conversations/create'

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

  post '/listings/:id/apply' => 'listings#submit_offer', as: 'submit_offer_listing'
  
  patch '/listings/:id/apply' => 'offer#edit', as: 'revise_offer_listing'
  # patch '/listings/:id/revise_offer_listing' => 'offers#edit', as: '/listings/:id/revise_offer_listing'
  resources :listings do
    resources :offer
  end

  patch '/listings/:id/offer' => 'listings#accept_offer', as: 'accept_offer'
  resources :portfolios do
    resources :reviews
    resources :photos
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
