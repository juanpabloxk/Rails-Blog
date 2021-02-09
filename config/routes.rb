Rails.application.routes.draw do
  resources :users, only: [:new,:create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'wellcome', to: 'sessions#welcome'

  resources :articles
  resources :categories do
    resources :articles do
      resources :comments
    end
  end
end
