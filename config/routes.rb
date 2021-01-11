Rails.application.routes.draw do
  resources :services
  get '/calendar/services', to: 'home#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
