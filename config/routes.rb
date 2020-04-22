Rails.application.routes.draw do
  post '/login', to: 'authentication#login'

  resources :currencies, only: [:index, :show]
  resources :users, param: :_username
end
