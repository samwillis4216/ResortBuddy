Rails.application.routes.draw do
  root to: 'pages#home'

  get 'home_guest', to: 'pages#home_guest'

  # Devise
  devise_for :employees, :controllers => { :registrations => "employees/employeesr" }
  devise_for :guests, :controllers => { :registrations => "guests/guestsr" }

  # Employees
  namespace :admin do
    resources :bookings, only: [:index, :show, :edit, :update, :destroy]

    resources :activities do
      resources :bookings, only: [:new, :create]
      resources :availabilities
    end
  end

  # Guests
  resources :activities, only: [:index, :show, :new] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show, :destroy]
  get '/my_activities', to: 'activities#my_activities'
end
