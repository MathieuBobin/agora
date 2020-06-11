Rails.application.routes.draw do
  root 'proposals#index'
  
  devise_for :users
  resources :users
  resources :users do
    resources :avatars, only: :create
  end

  resources :proposals do
    resources :votes, only: [:create, :destroy] 
    resources :pictures, only: :create
  end
  resources :proposals 

  resources :cities
end