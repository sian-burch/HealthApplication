Rails.application.routes.draw do
  resources :activities
  resources :user_data
  devise_for :users
  get 'home/about'
  root 'home#index'
end
