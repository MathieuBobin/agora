Rails.application.routes.draw do
  root 'proposals#index'
  get '/contact', to: 'additional_views#contact'
  get '/proposal_created', to: 'additional_views#proposal_created'
  get '/send_email_after_votes', to: 'proposals#send_email_after_votes', as: :send_vote_mail

  devise_for :users
  resources :users
  resources :users do
    resources :avatars, only: :create
  end

  resources :proposals
  resources :proposals do
    resources :votes, only: [:create, :destroy] 
    resources :pictures, only: :create
    resources :comments
  end

  resources :cities
  
end