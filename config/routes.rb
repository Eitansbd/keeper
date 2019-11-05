Rails.application.routes.draw do
  
  get '/signup', to: 'users#new'

  # doing this create help_path and help_url variables
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  
  # doing this creates root_path and root_url variables
  root 'static_pages#home'
  
  resources :users
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  
  resources :fishing_trips, only: [:create, :destroy]
end
