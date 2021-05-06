Rails.application.routes.draw do
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
  get 'new_daily_questionnaire' => 'user_daily_questionnaires#new'
  get '/new_user_data' => 'user_data#new', as: :new_user_data
  get 'show_weather' => 'user_daily_questionnaires#show_weather'
  get 'check_weather' => 'user_daily_questionnaires#check_weather'
  match '/show_weather', to: 'user_daily_questionnaires#show_weather', :via => [:get, :post]
end
