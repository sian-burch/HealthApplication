Rails.application.routes.draw do
  devise_for :users
  get 'home/about'
  root 'home#index'
end
