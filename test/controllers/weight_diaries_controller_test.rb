require 'test_helper'

class WeightDiariesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
    @weight_diary = weight_diaries(:one)
  end

  test "should get index" do
    get weight_diaries_url
    assert_response :success
  end

  test "should get new" do
    get new_weight_diary_url
    assert_response :success
  end

  test "should create weight_diary" do
    assert_difference('WeightDiary.count') do
      post weight_diaries_url, params: { weight_diary: { date: '2021-05-18', weight:55, user_id: 4 } }
    end

    assert_redirected_to weight_diary_url(WeightDiary.last)
  end

# Able to pass show delete update test, but URL path changed for set object.

  test "should show weight_diary" do
    get weight_diary_url(@weight_diary)
    assert_response :success
  end

end
