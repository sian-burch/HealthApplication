Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :mental_posts
  resources :posts
  resources :user_daily_questionnaires
  resources :recommended_daily_steps
  resources :activities
  resources :user_data
  devise_for :users
  get 'home/about'
  root 'home#index'
  get '/daily_recommendations' => 'user_daily_questionnaires#daily_recommendations'
  get '/user_data' => 'user_data#show'
  get '/my_daily_questionnaire' => 'user_daily_questionnaires#index'
  get '/new_daily_questionnaire' => 'user_daily_questionnaires#new'
  get '/new_user_data' => 'user_data#new', as: :new_user_data
  
end
