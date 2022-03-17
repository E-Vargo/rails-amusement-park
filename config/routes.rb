Rails.application.routes.draw do
  resources :attractions
  resources :rides
  resources :users
  root 'static#home'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session', to: 'session#destroy', as: 'logout'
  post '/attractions', to: 'ride#create' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
