Rails.application.routes.draw do
  get 'welcome/index', as: "welcome"
  root "welcome#index"
  resources :groups do    
    resources :movements
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end

