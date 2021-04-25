Rails.application.routes.draw do
  resources :daily_questionnaires
  resources :user_feedback_questionnaires
  resources :user_daily_questionnaires
  resources :activities
  resources :user_data
  devise_for :users
  get 'home/about'
  root 'home#index'
  get '/recommendations' => 'user_data#recommendations'
  get '/user_data' => 'user_data#show'
  get '/my_daily_questionnaire' => 'user_daily_questionnaires#index'
  get '/new_daily_questionnaire' => 'daily_questionnaires#new'
  get '/create_new_user_daily_questionnaire_for_daily_questionnaire' => 'user_daily_questionnaire#create_new_user_daily_questionnaire_for_daily_questionnaire'
  get '/my_feedback_questionnaire' => 'user_feedback_questionnaires#index'
  get '/daily_questionnaires' => 'daily_questionnaires#index'


  
end
