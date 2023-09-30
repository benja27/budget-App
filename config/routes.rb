Rails.application.routes.draw do
  get 'welcome/index', as: "welcome"
  root "welcome#index"
  resources :groups
  resources :movements
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end