Rails.application.routes.draw do
  # Devise
  devise_for :employees
  devise_for :guests

  # Guests
  resources :activities, only: [:index, :show] do
    resources :bookings, only: [:index, :create]
  end
  resources :bookings, only: [:destroy]

  # Employees
  namespace :admin do
    resources :bookings, only: [:index, :show, :edit, :update, :destroy]

    resources :activities do
      resources :bookings, only: [:new, :create]
      resources :availabilities
    end
  end
end
