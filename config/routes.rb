Rails.application.routes.draw do
  root 'welcome#index'

  # get '/login' => 'sessions#new'
  get '/sign-up' => 'sessions#new'
  # get '/sign-out' => 'sessions#destroy'

  get '/sign-in' => 'sessions#new', as: :signin
  # get '/sign-up' => 'identities#new'
  # post '/login' => 'sessions#create'


  get '/auth/:provider/callback' => 'sessions#create'
  post '/auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => 'fails#index'

  get '/sign-out' => 'sessions#destroy', as: :signout


  get '/shopping/:id' => 'shopping#index'
  get 'shopping/status/:id' => 'items#item_status'
  get '/lists/:id/submit' => 'lists#get_items'
  post '/shopping/:id' => 'emails#skipped_items_email'
  get '/welcome' => 'welcome#index'

  get '/recipes' =>'recipe_fetcher#index'

  get '/search' => 'recipe_fetcher#new'
  get '/recipes/search/:id' => 'recipe_fetcher#index'
  get '/recipes/:id' => 'recipe_fetcher#show'

  resources :secrets
  resources :identities

  resources :users
  resources :lists do
    resources :emails
  end
  resources :items


end
