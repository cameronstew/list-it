Rails.application.routes.draw do
  root 'sessions#new'

  get '/auth/:provider/callback' => 'sessions#create'
  post '/auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => 'fails#index'

  get '/shopping/:id' => 'shopping#index'
  get 'shopping/status/:id' => 'items#item_status'
  get '/lists/:id/submit' => 'lists#get_items'
  post '/shopping/:id' => 'emails#skipped_items_email'
  get '/welcome' => 'welcome#index'

  get '/recipes' =>'recipe_fetcher#index'

  get '/search' => 'recipe_fetcher#new'
  get '/recipes/search/:id' => 'recipe_fetcher#index'
  get '/recipes/:id' => 'recipe_fetcher#show'

  # resources :recipes, :controller => "recipe_fethcer", :path_names => { :new => "add" }

  # resources :recipe_fetchers
  resources :secrets
  resources :identities

  resources :users
  resources :lists do
    resources :emails
  end
  resources :items


end
