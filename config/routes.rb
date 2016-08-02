Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy, :new]
  get 'login',  to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
end
