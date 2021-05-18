Rails.application.routes.draw do

  get 'profiles/edit'
  get 'profiles/show'
  root to: "listings#index"
  devise_for :users
  resources :listings
  resources :profiles

end
