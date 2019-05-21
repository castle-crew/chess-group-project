Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  resources :games, only: [:new, :create, :show]
  resources :pieces, only: :update
end
