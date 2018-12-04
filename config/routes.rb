Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  # お気に入り機能
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :likes
    end
  end
  
  resources :relationship2s, only: [:create, :destroy]
  
end