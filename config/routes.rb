Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :courses

  root "welcome#index"
  get "/login" => "sessions#new"
  resource  :sessions, only: [:create, :destroy]

  resources :users
  resources :kids
  resources :home, only: [:index]
  get "/about" => "home#about"
  get "/contact" => "home#contact"
  get "/photos" => "home#photos"



end
