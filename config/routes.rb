Rails.application.routes.draw do
  root to: 'static_pages#top'
  get 'home', to: 'static_pages#home'
  resources :sessions, only: [:create, :destroy, :new]
  get 'login',  to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
end
