Rails.application.routes.draw do
  resources :services do
    resources :works
  end

  resources :works

  get '/home', to: 'home#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
