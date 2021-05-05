Rails.application.routes.draw do
  root 'rooms#index'
  
  resources :rooms, only: [:index, :show, :new, :create] do
    collection do
      get 'search', "posts"
    end
  end
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }
  
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    get "sign_up", :to => "users/registrations#new"
  end
end
