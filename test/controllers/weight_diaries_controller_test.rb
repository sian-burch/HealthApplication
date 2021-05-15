require 'test_helper'

class WeightDiariesControllerTest < ActionDispatch::IntegrationTest
  setup do
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
      post weight_diaries_url, params: { weight_diary: { date: @weight_diary.date, weight: @weight_diary.weight } }
    end

    assert_redirected_to weight_diary_url(WeightDiary.last)
  end

  test "should show weight_diary" do
    get weight_diary_url(@weight_diary)
    assert_response :success
  end

  test "should get edit" do
    get edit_weight_diary_url(@weight_diary)
    assert_response :success
  end

  test "should update weight_diary" do
    patch weight_diary_url(@weight_diary), params: { weight_diary: { date: @weight_diary.date, weight: @weight_diary.weight } }
    assert_redirected_to weight_diary_url(@weight_diary)
  end

  test "should destroy weight_diary" do
    assert_difference('WeightDiary.count', -1) do
      delete weight_diary_url(@weight_diary)
    end

    assert_redirected_to weight_diaries_url
  end
end
