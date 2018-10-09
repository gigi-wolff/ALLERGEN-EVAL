Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  delete '/products', to: 'products#destroy_all'

  resources :allergens
  delete '/allergens', to: 'allergens#destroy_all'

  resources :menus, only: [:index, :create]
  
  get '/reactions', to: 'reactions#index'

  resources :profiles, only: [:show, :edit]
  
  #CRUD is not applicable so resource is not an appropriate choice,
  #instead manually build routes 
  #/search is the route, it points to (=>) searches#search (controller_name#action  where action is a function) 
  get '/search' => 'searches#search', as: 'search_search'
  #root 'allergens#index'
  root 'products#index'

  #When we use resources routes, we are mapping the browser 
  #requests (HTTP verbs and URLs) to the controller actions 
  #of our app

  # routes are mapped to: controller actions (Order of declaration matters)
=begin
  # get '/products', to: 'products#index', as: 'products_path'
  # get '/products/:id', to: 'products#show', as: 'post_path(object)'
  # get '/products/:id/edit', to: 'products#edit', as: 'edit_product_path(object)'
  # get '/products/new', to: 'products#new', as: 'new_product_path'
  # post '/products', to: 'products#create'
  # patch '/products/:id', to: 'products#update'
  # delete '/products/:id', to: 'products#destroy'
  # resource routing maps routes to controller actions replacing code above
  # with a single line of code:   "resources :products"
=end

end
