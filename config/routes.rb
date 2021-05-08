Rails.application.routes.draw do
  root('static#home') 

 #Restful Routes for Journals 
resources :journals do 
  resources :entries
end
#journals/:journal_id/entries/:id

resources :users, only: [:new, :create]

get "/login", to: "sessions#new"
post "/login", to: "sessions#create"

get "/logout", to: "sessions#logout", as: "logout" #change get to delete?

get "/signup", to: "sessions#signup", as: "signup"
post "/signup", to: "sessions#create"

end
