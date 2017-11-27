Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  root to: 'pages#home'
  resources :pages

  get 'home_guest', to: 'pages#home_guest'

  get 'profile_guest', to: 'pages#profile_guest'
  patch 'profile_guest', to: 'pages#profile_update'

  get 'activities/:id/rerender', to: 'activities#rerender', as: :rerender


  # Devise
  devise_for :employees, :controllers => { :registrations => "employees/registrations" }
  devise_for :guests, :controllers => { :registrations => "guests/registrations" }

  # Employees
  namespace :admin do
    resources :bookings, only: [:index, :show, :edit, :update, :destroy]
    get 'my_activities', to: 'activities#my_activities'
    resources :activities do

      resources :bookings, only: [:new, :create]
      resources :availabilities
    end
  end

  # Guests
  resources :activities, only: [:index, :show, :new] do
    resources :bookings, only: [:create]
    resources :availabilities, only: [:show] do
    end
  end
  resources :bookings, only: [:index, :show, :destroy]

  resources :chatrooms do
    resources :messages, only: [:create]
  end
end
