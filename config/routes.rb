Rails.application.routes.draw do
  root 'sessions#wellcome'
  resources :users, only: [:new,:create,:index,:show]
  post "users/:id/follow", to: "users#add_follower"
  get "unauthorized", to: "sessions#unauthorized"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "wellcome", to: "sessions#wellcome"
  delete "logout", to: "sessions#destroy"
  resources :articles
  resources :categories do
    resources :articles do
      resources :comments
    end
  end
end
