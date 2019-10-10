Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resource :dashboard, only: [:show]
  resource :user_accounts
  resource :my_games, only: [:show]
  resources :games do
    resources :cps, only: [:create, :destroy]
  end
  get 'search', to: 'games#search', as: :search_games
end
