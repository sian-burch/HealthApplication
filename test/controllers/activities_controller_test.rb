require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity = activities(:one)
  end

  test "should get index" do
    get activities_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_url
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post activities_url, params: { activity: { cardio_score: @activity.cardio_score, duration: @activity.duration, indoor_score: @activity.indoor_score, intensity_score: @activity.intensity_score, mentality_score: @activity.mentality_score, name: @activity.name, outdoor_score: @activity.outdoor_score, physicality_score: @activity.physicality_score, solo_score: @activity.solo_score, strength_score: @activity.strength_score, team_score: @activity.team_score } }
    end

    assert_redirected_to activity_url(Activity.last)
  end

  test "should show activity" do
    get activity_url(@activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_url(@activity)
    assert_response :success
  end

  test "should update activity" do
    patch activity_url(@activity), params: { activity: { cardio_score: @activity.cardio_score, duration: @activity.duration, indoor_score: @activity.indoor_score, intensity_score: @activity.intensity_score, mentality_score: @activity.mentality_score, name: @activity.name, outdoor_score: @activity.outdoor_score, physicality_score: @activity.physicality_score, solo_score: @activity.solo_score, strength_score: @activity.strength_score, team_score: @activity.team_score } }
    assert_redirected_to activity_url(@activity)
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete activity_url(@activity)
    end

    assert_redirected_to activities_url
  end
end
