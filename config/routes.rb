Rails.application.routes.draw do

  get 'entries/index'
  get 'entries/show'
  get 'entries/new'
  get 'entries/edit'
  get 'journals/index'
  get 'journals/show'
  get 'journals/new'
  get 'journals/edit'
  get 'sessions/sign_up'
  get 'static/home'
  get 'users/new'
resources :journals do 
  resources :entries
end
#journals/:journal_id/entries/:id

resources :users, only: [:new, :create]

end
