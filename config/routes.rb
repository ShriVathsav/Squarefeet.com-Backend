Rails.application.routes.draw do
  resources :profiles
  resources :properties
  
  post '/login', to: 'auth#login'
  get '/auth', to: 'auth#persist'
  get '/profiles/getProperties/:id', to: 'profiles#getProperties'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
