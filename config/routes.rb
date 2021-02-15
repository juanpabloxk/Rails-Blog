Rails.application.routes.draw do
  root 'sessions#wellcome'
  resources :users, only: [:new,:create,:index,:show] do
    post "follow", to: "users#add_follower"
    post "unfollow", to: "users#del_follower"
  end
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

