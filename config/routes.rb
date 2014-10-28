Rails.application.routes.draw do

  root "welcome#index"
  get "/login" => "sessions#new"
  resource  :sessions, only: [:create, :destroy]

  resources :users
  resources :kids
  resources :home, only: [:index]
  resources :about, only: [:index]
  resources :contact, only: [:index]
  resources :photos, only: [:index]


end
