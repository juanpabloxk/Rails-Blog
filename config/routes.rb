Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  root "articles#index"
  resources :articles
  resources :categories do
    resources :articles do
      resources :comments
    end
  end
end
