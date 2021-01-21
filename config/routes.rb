Rails.application.routes.draw do
  get '/', to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'login_post'
  get '/signup', to: 'users#new', as: 'new_user'

  get '/home', to: 'home#home'
 
  resources :services
  post '/services/:id/copy', to: 'services#duplicate', as: 'duplicate_service'
  get  '/services/:service_id/work/:id', to: 'service_works#destroy', as: 'delete_service_work'

  resources :works, only: [:index]

  resources :composers, only: [:new, :create, :edit, :update, :destroy]  do 
    resources :works, only: [:new, :show]
  end

  
  resources :users, except: :new

  

 
  delete '/logout', to: 'sessions#destroy', as: 'log_out'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
