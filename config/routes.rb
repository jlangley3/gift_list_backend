Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :gifts
      resources :interests
      resources :contacts
      resources :events
      resources :users, only: [:index, :show, :create, :update]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/token', to: 'auth#log_in'
    end
  end
end
