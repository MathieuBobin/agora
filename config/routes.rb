Rails.application.routes.draw do
  root 'proposals#index'
  get '/contact', to: 'additional_views#contact'
  get '/proposal_created', to: 'additional_views#proposal_created'
  get '/policy', to: 'additional_views#policy'
  get '/legal', to: 'additional_views#legal'
  get '/mon_profil', to: 'users#show', as: 'mon_profil'
  get '/editer_mon_profil', to: 'users#edit', as: 'editer_mon_profil'
  #get 'ma_ville', to: 'cities#show', as: 'ma_ville'
  #get '/send_email_after_votes', to: 'proposals#send_email_after_votes', as: :send_vote_mail

  resources :cities
  
  devise_for :users
  resources :users
  resources :users do
    resources :avatars, only: :create
  end

  resources :proposals
  resources :proposals do
    resources :votes, only: [:create, :destroy] 
    resources :pictures, only: :create
    resources :comments do
      resources :likes, only: [:create, :destroy, :edit]
      resources :comments, only: [:create, :destroy, :edit]
    end
  end
end