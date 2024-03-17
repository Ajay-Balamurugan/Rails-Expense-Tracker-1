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

  #add payment
  get "add_payment", to:"payments#new"
  post "add_payment", to:"payments#create" 

  #view payment
  get "view_payment", to:"payments#index"

  #delete payment
  delete "delete_payment/:id", to:"payments#destroy", as: :delete_payment

  #update payment
  get "edit_payment/:id", to: "payments#edit", as: :edit_payment
  patch "update_payment/:id", to: "payments#update", as: :update_payment

  #add category
  get "add_category", to:"categories#new"
  post "add_category", to:"categories#create"

  #view category
  get "view_category", to:"categories#index"

  #delete payment
  delete "delete_category/:id", to:"categories#destroy", as: :delete_category

  #update payment
  get "edit_category/:id", to: "categories#edit", as: :edit_category
  patch "update_category/:id", to: "categories#update", as: :update_category
end
