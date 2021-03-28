Rails.application.routes.draw do
  resources :user_data
  devise_for :users
  get 'home/about'
  root 'home#index'
end
