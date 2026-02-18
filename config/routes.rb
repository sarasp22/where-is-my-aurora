Rails.application.routes.draw do
  get 'notifications/index'
  get 'weather/index'
  get 'forecast/index'
  get 'auroras/index'
  get 'auroras/show'
  get 'auroras/new'
  get 'auroras/create'
  get 'auroras/upload_photo'
  get 'auroras/submit'
  get 'sessions/set_geolocation'
  get 'sessions/share_app'
  get 'home/index'
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
