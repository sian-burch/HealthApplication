require 'test_helper'

class RecommendedDailyStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recommended_daily_step = recommended_daily_steps(:one)
  end

  test "should get index" do
    get recommended_daily_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_recommended_daily_step_url
    assert_response :success
  end

  test "should create recommended_daily_step" do
    assert_difference('RecommendedDailyStep.count') do
      post recommended_daily_steps_url, params: { recommended_daily_step: { age: @recommended_daily_step.age, high: @recommended_daily_step.high, medium: @recommended_daily_step.medium, minimum: @recommended_daily_step.minimum } }
    end

    assert_redirected_to recommended_daily_step_url(RecommendedDailyStep.last)
  end

  test "should show recommended_daily_step" do
    get recommended_daily_step_url(@recommended_daily_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_recommended_daily_step_url(@recommended_daily_step)
    assert_response :success
  end

  test "should update recommended_daily_step" do
    patch recommended_daily_step_url(@recommended_daily_step), params: { recommended_daily_step: { age: @recommended_daily_step.age, high: @recommended_daily_step.high, medium: @recommended_daily_step.medium, minimum: @recommended_daily_step.minimum } }
    assert_redirected_to recommended_daily_step_url(@recommended_daily_step)
  end

  test "should destroy recommended_daily_step" do
    assert_difference('RecommendedDailyStep.count', -1) do
      delete recommended_daily_step_url(@recommended_daily_step)
    end

    assert_redirected_to recommended_daily_steps_url
  end
end
