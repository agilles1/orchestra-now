Rails.application.routes.draw do
  resources :services 

  get '/services/:service_id/works/new', to: 'works#service_works_new', as: 'new_service_works'
  get '/services/:service_id/works/edit', to: 'works#service_works_edit', as: 'edit_service_works'
  post '/services/:service_id/works', to: 'works#service_works_create'
  patch '/services/:service_id/works', to: 'works#service_works_update'
  delete  '/services/:service_id/works', to: 'works#service_works_update'
  
  resources :works

  get '/home', to: 'home#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
