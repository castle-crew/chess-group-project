Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
   resources :games  
    patch 'forfeit', to: 'games#forfeit', as: :forfeit
    patch 'check', to: 'games#check', as: :check
  # resources :games, only: [:new, :index, :create, :show, :update, :forfeit]
  resources :pieces, only: :update
  resources :boards, only: [:create, :show]
  resources :forfeit, only: :create
end
