Rails.application.routes.draw do
  resources :cinemas do
    resources :movies
    resources :timeslots
    resources :bookings, only: [:create]
    resources :users, only: [:new, :create]
    
    resources :sessions, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    delete 'logout', to: 'sessions#destroy', as: :cinema_logout
    get 'login', to: 'sessions#new', as: :cinema_login
    post '/login', to: 'sessions#create'
    post 'sessions', to: 'sessions#create'
  end

  root 'cinemas#index'
  post 'cinemas/:cinema_id/timeslots/:timeslot_id/bookings', to: 'bookings#create', as: 'cinema_timeslot_bookings'
  get '/cinemas/:cinema_id/users/:id', to: 'users#show', as: 'user'
  match '*path', to: redirect('sessions#new'), via: :all
end
