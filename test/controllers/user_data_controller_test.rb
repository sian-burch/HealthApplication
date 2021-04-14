require 'test_helper'

class UserDataControllerTest < ActionDispatch::IntegrationTest
  setup do
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
      post user_data_url, params: { user_datum: { BMI: @user_datum.BMI, age: @user_datum.age, athletic_lvl: @user_datum.athletic_lvl, duration_pref: @user_datum.duration_pref, frequency_pref: @user_datum.frequency_pref, gender: @user_datum.gender, height: @user_datum.height, indoor: @user_datum.indoor, meditation: @user_datum.meditation, mental: @user_datum.mental, outdoor: @user_datum.outdoor, physical: @user_datum.physical, running: @user_datum.running, walking: @user_datum.walking, weight: @user_datum.weight } }
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
    patch user_datum_url(@user_datum), params: { user_datum: { BMI: @user_datum.BMI, age: @user_datum.age, athletic_lvl: @user_datum.athletic_lvl, duration_pref: @user_datum.duration_pref, frequency_pref: @user_datum.frequency_pref, gender: @user_datum.gender, height: @user_datum.height, indoor: @user_datum.indoor, meditation: @user_datum.meditation, mental: @user_datum.mental, outdoor: @user_datum.outdoor, physical: @user_datum.physical, running: @user_datum.running, walking: @user_datum.walking, weight: @user_datum.weight } }
    assert_redirected_to user_datum_url(@user_datum)
  end

  test "should destroy user_datum" do
    assert_difference('UserDatum.count', -1) do
      delete user_datum_url(@user_datum)
    end

    assert_redirected_to user_data_url
  end
end
