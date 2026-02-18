Rails.application.routes.draw do
  root 'home#index'

  post '/geolocation', to: 'sessions#set_geolocation'

  resources :auroras, only: [:index, :show, :new, :create]

  get '/weather',      to: 'weather#index'
  get '/forecast',     to: 'forecast#index'
  get '/forecast/kp_now', to: 'forecast#kp_now'

  resources :notifications, only: [:index]
end
