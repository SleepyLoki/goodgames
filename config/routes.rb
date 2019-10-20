Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resource :my_games, only: [:show]
  resources :games do
    resources :cps, only: [:create, :destroy]
    resources :wtps, only: [:create, :destroy]
    resources :hps, only: [:create, :destroy]
    resources :photos, only: :create
    resources :comments, only: :create
  end
  resources :users, only: :show
  get 'search', to: 'games#search', as: :search_games
end
