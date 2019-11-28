Rails.application.routes.draw do
  
  get '/signup', to: 'users#new'

  # doing this create help_path and help_url variables
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  
  # doing this creates root_path and root_url variables
  root 'static_pages#home'
  
  resources :fish_catches, only: [:index, :destroy, :create]
  
  resources :users
  patch '/users/:id/profile_image', to: "users#create_image", as: "users_profile_image"
  resources :fishing_trips
  
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
end
