Rails.application.routes.draw do
  

  resources :cinemas do
    resources :movies
    resources :timeslots
    resources :bookings
    resources :bookings, only: [:create]
    resources :users
    resources :users, only: [:new, :create]
   
    

    
  end
  root 'cinemas#index'
  post 'cinema/:cinema_id/timeslot/:timeslot_id/bookings', to: 'bookings#create', as: 'cinema_timeslot_bookings'
  get '/new_cinema_user', to: 'users#new'

end