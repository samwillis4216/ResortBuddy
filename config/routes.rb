Rails.application.routes.draw do
  scope :guests do
    root to: 'pages#home_guest'
  end
  scope :employees do
    root to: 'pages#home'
  end

  root to: 'pages#home'
  # get '/home_guest', to: 'pages#home_guest'

  # Devise
  devise_for :employees
  devise_for :guests

  # Employees
  namespace :admin do
    resources :bookings, only: [:index, :show, :edit, :update, :destroy]

    resources :activities do
      resources :bookings, only: [:new, :create]
      resources :availabilities
    end
  end

  # Guests
  resources :activities, only: [:index, :show] do
    resources :bookings, only: [:index, :create]
  end
  resources :bookings, only: [:destroy]

end
