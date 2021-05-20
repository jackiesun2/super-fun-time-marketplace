Rails.application.routes.draw do

  root to: "listings#index"
  devise_for :users
  resources :listings 
  resources :profiles do
    resources :reviews
  end
  resources :reviews
end
