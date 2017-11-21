Rails.application.routes.draw do

<<<<<<< HEAD
  get 'availabilities/index'

  get 'availabilities/show'

  get 'availabilities/new'

  get 'availabilities/create'

  get 'availabilities/edit'

  get 'availabilities/update'

  get 'availabilities/destroy'

  get 'bookings/index'

  get 'bookings/show'

  get 'bookings/new'

  get 'bookings/create'

  get 'bookings/edit'

  get 'bookings/update'

  get 'bookings/destroy'

  root to: 'pages#home'
=======
>>>>>>> master
  devise_for :employees
  devise_for :guests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :activities do
    resources :availabilities
  end

  resources :bookings

end
