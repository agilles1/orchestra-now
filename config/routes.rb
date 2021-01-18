Rails.application.routes.draw do
  resources :services 

  # get '/services/:service_id/works/new', to: 'works#service_works_new', as: 'new_service_works'
  # get '/services/:service_id/works/edit', to: 'works#service_works_edit', as: 'edit_service_works'
  # post '/services/:service_id/works', to: 'works#service_works_create', as: 'service_works'
  # patch '/services/:service_id/works', to: 'works#service_works_update'
  get  '/services/:service_id/work/:id', to: 'service_works#destroy', as: 'delete_service_work'
  
  resources :works, only: [:index, :show]

  resources :users, except: :new

  get '/home', to: 'home#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'new_user'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
                  #            services GET    /services(.:format)                                                                      services#index
                  #                     POST   /services(.:format)                                                                      services#create
                  #         new_service GET    /services/new(.:format)                                                                  services#new
                  #        edit_service GET    /services/:id/edit(.:format)                                                             services#edit
                  #             service GET    /services/:id(.:format)                                                                  services#show
                  #                     PATCH  /services/:id(.:format)                                                                  services#update
                  #                     PUT    /services/:id(.:format)                                                                  services#update
                  #                     DELETE /services/:id(.:format)                                                                  services#destroy
                  #   new_service_works GET    /services/:service_id/works/new(.:format)                                                works#service_works_new
                  #  edit_service_works GET    /services/:service_id/works/edit(.:format)                                               works#service_works_edit
                  #                     POST   /services/:service_id/works(.:format)                                                    works#service_works_create
                  #                     PATCH  /services/:service_id/works(.:format)                                                    works#service_works_update
                  #                     DELETE /services/:service_id/works(.:format)                                                    works#service_works_update
                  #               works GET    /works(.:format)                                                                         works#index
                  #                     POST   /works(.:format)                                                                         works#create
                  #            new_work GET    /works/new(.:format)                                                                     works#new
                  #           edit_work GET    /works/:id/edit(.:format)                                                                works#edit
                  #                work GET    /works/:id(.:format)                                                                     works#show
                  #                     PATCH  /works/:id(.:format)                                                                     works#update
                  #                     PUT    /works/:id(.:format)                                                                     works#update
                  #                     DELETE /works/:id(.:format)                                                                     works#destroy
                  #                home GET    /home(.:format)                                                                          home#home