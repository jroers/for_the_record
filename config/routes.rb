Rails.application.routes.draw do
  root to: 'users#index'

  get '/users', to: 'users#index', as: "users"
  get '/signup', to: 'users#new', as: "signup"
  post "/users", to: "users#create"
  get '/profile', to: 'users#show', as: "user_profile"

  get '/login', to: 'sessions#new', as: 'login'
  get "/logout", to: "sessions#destroy", as: 'logout'
  post "/sessions", to: "sessions#create"

  get '/profile/temperatures', to: 'results#temperature', as: "temperatures"
end
