Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#omniauth'
 
  resources :services 

  get  '/services/:service_id/work/:id', to: 'service_works#destroy', as: 'delete_service_work'
  
  resources :works, only: [:index, :show]

  resources :users, except: :new

  get '/home', to: 'home#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'login_post'
  get '/signup', to: 'users#new', as: 'new_user'
  delete '/logout', to: 'sessions#destroy', as: 'log_out'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
