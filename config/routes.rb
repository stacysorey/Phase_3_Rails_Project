Rails.application.routes.draw do

  resources :events
  root('static#home') 

 #Restful Routes for Journals 
resources :journals do 
  resources :entries
end
#journals/:journal_id/entries/:id

resources :users, only: [:new, :create]
resources :entry_types, only: [:new, :create]

get "/login", to: "sessions#new"
post "/login", to: "sessions#create"

get "/logout", to: "sessions#logout", as: "logout" #change get to delete?

get "/signup", to: "users#new", as: "signup"
post "/signup", to: "users#create"

get '/search', to: 'journals#search', as: 'search'

match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]
#goes to specific route, can be multiple routes at once: get/post/patch/delete/etc
end
