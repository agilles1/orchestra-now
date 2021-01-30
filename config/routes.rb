Rails.application.routes.draw do
  get '/', to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'login_post'
  get '/signup', to: 'users#new', as: 'new_user'
  get '/home', to: 'home#home'  
  post '/services/:id/copy', to: 'services#duplicate', as: 'duplicate_service'
  get  '/services/:service_id/work/:id', to: 'service_works#destroy', as: 'delete_service_work'
  delete '/logout', to: 'sessions#destroy', as: 'log_out'

  resources :services
  resources :works, only: :index
  resources :users, only: :create
  resources :composers, only: [:new, :create, :edit, :update]  do 
    resources :works
  end

end
