Rails.application.routes.draw do
  get 'welcome/index', as: "welcome"
  root "welcome#index"
  resources :groups, only: [:index, :show, :destroy, :new, :create]  do    
    resources :movements, only: [:show, :destroy, :new, :index, :create]
  end
  devise_for :users
end

