Rails.application.routes.draw do
  # static_pages
  root to: 'static_pages#top'
  get 'home', to: 'static_pages#home'

  # issues
  resources :issues, only: [:index, :show]
  
  # sessions
  resources :sessions, only: [:create, :destroy, :new]
  get 'login',  to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # users
  resources :users, only: [:create, :new, :show]
  get 'signup', to: 'users#new'
end
