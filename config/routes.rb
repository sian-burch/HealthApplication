Rails.application.routes.draw do
  resources :weight_diaries
  resources :mental_posts
  resources :posts
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :user_daily_questionnaires
  resources :recommended_daily_steps
  resources :activities
  resources :user_data
  devise_for :users


  get '/index' => 'home#index'
  get '/signed_out_home' => 'home#signed_out_home'
  get '/about_us' => 'home#about'
  #root 'home#index'
  root 'home#signed_out_home'
  get '/daily_recommendations' => 'user_daily_questionnaires#daily_recommendations'
  get '/user_data' => 'user_data#show'
  get '/my_daily_questionnaire' => 'user_daily_questionnaires#index'
  get '/new_daily_questionnaire' => 'user_daily_questionnaires#new'
  get 'new_daily_questionnaire' => 'user_daily_questionnaires#new'
  get '/contact' => 'home#contact'
  get '/feedback' => 'home#feedback'
  get '/new_user_data' => 'user_data#new', as: :new_user_data
  get 'show_weather' => 'user_daily_questionnaires#show_weather'
  get 'check_weather' => 'user_daily_questionnaires#check_weather'
  match '/show_weather', to: 'user_daily_questionnaires#show_weather', :via => [:get, :post]
  post 'request_contact', to: 'home#request_contact'
  post 'request_feedback', to: 'home#request_feedback'
  # Routes for cookies
  get '/cookies', to: 'home#cookies'
  get 'users/cookies', to: 'home#cookies'
  get 'user_daily_questionnaires/cookies', to: 'home#cookies'
  get 'user_data/cookies', to: 'home#cookies'
  get 'activities/cookies', to: 'home#cookies'
  # Route for privacy policy and disclaimer
  get '/privacy_policy', to: 'home#privacy_policy'
  get '/disclaimer', to: 'home#disclaimer'
  get 'spotify_playlist', to: 'home#spotify_playlist'
  mount ActionCable.server => "/cable"
end
