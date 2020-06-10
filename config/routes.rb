Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'proposals#index'
  resources :proposals do
    resources :pictures, only: [:create]
  end
end