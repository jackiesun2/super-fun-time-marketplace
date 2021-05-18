Rails.application.routes.draw do

  root to: "listings#index"
  devise_for :users
  resources :listings

end
