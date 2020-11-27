Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  get '/about', to: 'pages#about'

  resources :wands do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update, :show, :destroy] do
    member do
      post :approve
      post :decline
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
