DemoApi::Application.routes.draw do
  resources :stuffs
  resource :sessions
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout
  resources :users

  root :to => 'stuffs#index'
end
