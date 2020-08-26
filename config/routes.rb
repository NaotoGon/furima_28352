Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:show, :edit, :update]
  resources :items do
    resources :orders, only: [:index, :new, :create]
    # post 'items/:item_id/orders' => 'chat_rooms#show'
  end
end
