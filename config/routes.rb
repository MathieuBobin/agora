Rails.application.routes.draw do
  root 'proposals#index'
  get '/contact', to: 'additional_views#contact'
  get '/proposal_created', to: 'additional_views#proposal_created'

  devise_for :users
  resources :users
  resources :users do
    resources :avatars, only: :create
  end

  resources :proposals
  resources :proposals do
    resources :votes, only: [:create, :destroy] 
    resources :pictures, only: :create
  end

  resources :cities
end