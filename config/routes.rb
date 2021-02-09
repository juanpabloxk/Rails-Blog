Rails.application.routes.draw do
  root 'articles#index'
  resources :users, only: [:new,:create]
  get "login", to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get "wellcome", to: "sessions#wellcome"
  delete "logout", to: "sessions#destroy"
  resources :articles
  resources :categories do
    resources :articles do
      resources :comments
    end
  end
end
