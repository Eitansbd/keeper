Rails.application.routes.draw do
  
  
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/help', to: 'static_pages#help'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  post '/demo_login', to: 'sessions#demo_login'
  
  resources :users
  patch '/users/:id/profile_image', to: "users#create_image", as: "users_profile_image"
  resources :fish_catches, only: [:index, :destroy, :create]
  resources :fishing_trips
  
  
  
end
