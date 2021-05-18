require 'test_helper'

class UserDailyQuestionnairesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
    @user_daily_questionnaire = user_daily_questionnaires(:one)
    @user_daily_questionnaire.user=users(:one)
  end

  test "should get index" do
    get user_daily_questionnaires_url
    assert_response :success
  end

  test "should get new" do
    get new_user_daily_questionnaire_url
    assert_response :success
  end

  test "should create user_daily_questionnaire" do
    assert_difference('UserDailyQuestionnaire.count') do
      post user_daily_questionnaires_url, params: { user_daily_questionnaire: { cardio_score: @user_daily_questionnaire.cardio_score, day_of_week: "Monday", duration_mins: @user_daily_questionnaire.duration_mins, duration_score: @user_daily_questionnaire.duration_score, indoor_score: @user_daily_questionnaire.indoor_score, intensity_score: @user_daily_questionnaire.intensity_score, mentality_score: @user_daily_questionnaire.mentality_score, outdoor_score: @user_daily_questionnaire.outdoor_score, physicality_score: @user_daily_questionnaire.physicality_score, questionnaire_date: @user_daily_questionnaire.questionnaire_date, solo_score: @user_daily_questionnaire.solo_score, strength_score: @user_daily_questionnaire.strength_score, team_score: @user_daily_questionnaire.team_score, user_mood: @user_daily_questionnaire.user_mood } }
    end

    assert_redirected_to root_path
  end

# Able to pass show delete update test, but URL path changed for set object.

end
