Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
<<<<<<< HEAD

  resources :games, only: [:new, :index, :create, :show, :update]
=======
   resources :games  
    patch 'forfeit', to: 'games#forfeit', as: :forfeit
  # resources :games, only: [:new, :index, :create, :show, :update, :forfeit]
>>>>>>> fc93c4176ebfbc21495fea944fa9eaef778fe98f
  resources :pieces, only: :update
  resources :boards, only: [:create, :show]
  resources :forfeit, only: :create
end
