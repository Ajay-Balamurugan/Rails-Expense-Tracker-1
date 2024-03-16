Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "main#index"

  #sign up
  get "signup", to:"signup#new"
  post "signup", to:"signup#create"

  #login
  get "login", to:"sessions#new"
  post "login", to:"sessions#create"

  #logout
  delete "logout", to:"sessions#destroy"
end
