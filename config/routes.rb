Rails.application.routes.draw do
  get "/home", to: "static#home"

 #Restful Routes for Journals 
resources :journals do 
  resources :entries
end
#journals/:journal_id/entries/:id

resources :users, only: [:new, :create]

get "/logout", to: "sessions#logout", as: "logout"
get "/signup", to: "sessions#signup", as: "signup"
post "/signup", to: "sessions#create"

end
