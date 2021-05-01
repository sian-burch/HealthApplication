require 'test_helper'

class UserDataControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
    @user_datum = user_data(:one)
  end

  test "should get index" do
    get user_data_url
    assert_response :success
  end

  test "should get new" do
    get new_user_datum_url
    assert_response :success
  end

  test "should create user_datum" do
    assert_difference('UserDatum.count') do
      post user_data_url, params: { user_datum: { height: @user_datum.height, weight: @user_datum.weight, age:@user_datum.age, gender: @user_datum.gender, athletic_lvl: @user_datum.athletic_lvl, physical: @user_datum.physical, mental: @user_datum.mental, indoor_score: @user_datum.indoor_score, outdoor_score: @user_datum.outdoor_score,cardio_score: @user_datum.cardio_score,strength_score: @user_datum.strength_score,physicality_score: @user_datum.physicality_score,mentality_score: @user_datum.mentality_score,solo_score: @user_datum.solo_score,team_score: @user_datum.team_score,intensity_score: @user_datum.intensity_score ,frequency_pref: @user_datum.frequency_pref, duration_pref: @user_datum.duration_pref, BMI: @user_datum.BMI } }
    end

    assert_redirected_to user_datum_url(UserDatum.last)
  end

  test "should show user_datum" do
    get user_datum_url(@user_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_datum_url(@user_datum)
    assert_response :success
  end

  test "should update user_datum" do
    patch user_datum_url(@user_datum), params: { user_datum: { height: @user_datum.height, weight: @user_datum.weight, age:@user_datum.age, gender: @user_datum.gender, athletic_lvl: @user_datum.athletic_lvl, physical: @user_datum.physical, mental: @user_datum.mental, indoor_score: @user_datum.indoor_score, outdoor_score: @user_datum.outdoor_score,cardio_score: @user_datum.cardio_score,strength_score: @user_datum.strength_score,physicality_score: @user_datum.physicality_score,mentality_score: @user_datum.mentality_score,solo_score: @user_datum.solo_score,team_score: @user_datum.team_score,intensity_score: @user_datum.intensity_score ,frequency_pref: @user_datum.frequency_pref, duration_pref: @user_datum.duration_pref, BMI: @user_datum.BMI } }
    assert_redirected_to user_datum_url(@user_datum)
  end

  test "should destroy user_datum" do
    assert_difference('UserDatum.count', -1) do
      delete user_datum_url(@user_datum)
    end

    assert_redirected_to user_data_url
  end
end
