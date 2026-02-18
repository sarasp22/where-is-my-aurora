Rails.application.routes.draw do
  root 'home#index'

  post '/geolocation',    to: 'sessions#set_geolocation'

  resources :auroras, only: [:index, :show, :new, :create] do
    member do
      post :upload_photo
      post :submit
    end
  end

  resources :notifications, only: [:index]
  resources :rewards,       only: [:index]
  get '/forecast',          to: 'forecast#index'
  get '/weather',           to: 'weather#index'
  get '/share',             to: 'sessions#share_app'
end
