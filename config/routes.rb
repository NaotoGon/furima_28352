Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:show, :edit, :update]
  resources :items
  resources :transactions, only: [:index]
end
