Rails.application.routes.draw do

  resources :people do
    resources :addresses
    resources :emails
    resources :phone_numbers
  end
  
  # root "sessions#home"
  root "people#index"

  # resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  # resources :users, only: [:new, :create, :destroy]
  get '/register', to: 'users#new'
  resources :users, only: [:create]

  # get "/login", to: "sessions#login"
  # post "/login", to: "sessions#create"
  # post "/logout", to: "sessions#destroy"
  # get "/logout", to: "sessions#destroy"

  get '/login', to: 'sessions#new'
  post "/login", to: "sessions#create"
  get '/logout', to: 'sessions#destroy'
  # resource :sessions, only: [:create]

end
