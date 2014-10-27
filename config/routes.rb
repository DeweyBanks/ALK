Rails.application.routes.draw do

  root "welcome#index"
  get "/login" => "sessions#new"
  resource  :sessions, only: [:create, :destroy]

  resources :users
  resources :kids


end
