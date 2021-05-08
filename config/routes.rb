Rails.application.routes.draw do
  root "home#top"
  
  devise_for :users
  
  resources :rooms, only: [:index, :show, :new, :create] do
    collection do
      get "search", "posts"
    end
  end
  resources :reservations, only: [:index, :show, :new, :create]
  
  resources :users, only: :update 
  get "users/account", to: "users#account"
  get "users/profile", to: "users#profile"
  
end