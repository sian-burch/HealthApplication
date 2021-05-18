require 'test_helper'

class UserDataControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    @current_user = users(:one)
    post user_session_url
    @user_datum = user_data(:one)
    @recommended_daily_steps = recommended_daily_steps(:one)
  end

  test "should get index" do
    get user_data_url
    assert_response :success
  end

  test "should get check_weather url if no user_data exist" do
    get check_weather_path
    assert_response :success
  end

  test "should create user_datum" do
    assert_difference('UserDatum.count') do
      post recommended_daily_steps_url, params: { recommended_daily_step: {  id: 1, age: 23, minimum: 6000, medium: 10000, high: 14500 } }
      post user_data_url, params: { user_datum: { id:5, height: 180, weight: 55.0, age: 23, gender: "Male", athletic_lvl: "Beginner", physical: true, mental: false, indoor_score: 4, outdoor_score: 3, frequency_pref: 1, duration_pref: 15, BMI: 17.0, user_id: 3, cardio_score: 5, strength_score: 2, physicality_score: 4, mentality_score: 5, solo_score: 3, team_score: 4, intensity_score: 4, recommended_daily_steps: 3000, user:@current_user } }
    end

    assert_redirected_to root_path
  end

  # Able to pass show delete update test, but URL path changed for set object.
end
