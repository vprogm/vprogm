Rails.application.routes.draw do
  devise_for :users

  resources :tickets, only: %i[create show new]

  resource :search, only: %i[new show edit create] 

  namespace :admin do 
    resources :railway_stations do
      patch :update_position, on: :member
    end
    resources :trains do
      resources :carriages, shallow: true 
    end
    resources :routes
    resources :tickets
  end

  get 'welcome/index'

  root 'searches#show'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
