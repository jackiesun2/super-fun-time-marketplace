Rails.application.routes.draw do

  root to: "listings#index"
  devise_for :users
  resources :listings do
    resources :bookings, only: [:destroy, :create]
  end
  resources :profiles do
    resources :reviews
  end
  resources :reviews, only: [:new]
end
