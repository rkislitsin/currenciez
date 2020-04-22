Rails.application.routes.draw do
  resources :currencies, only: [:index, :show]
  resources :users, param: :_username
end
