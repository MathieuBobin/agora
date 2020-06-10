Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root 'proposals#index'

  resources :cities

  resources :proposals do 
    resources :votes, only: [:create, :destroy] 
  end

end
