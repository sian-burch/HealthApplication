require 'test_helper'

class DailyQuestionnairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_questionnaire = daily_questionnaires(:one)
  end

  test "should get index" do
    get daily_questionnaires_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_questionnaire_url
    assert_response :success
  end

  test "should create daily_questionnaire" do
    assert_difference('DailyQuestionnaire.count') do
      post daily_questionnaires_url, params: { daily_questionnaire: { cardio_score: @daily_questionnaire.cardio_score, dayOfWeek: @daily_questionnaire.dayOfWeek, duration_mins: @daily_questionnaire.duration_mins, duration_score: @daily_questionnaire.duration_score, indoor_score: @daily_questionnaire.indoor_score, intensity_score: @daily_questionnaire.intensity_score, mentality_score: @daily_questionnaire.mentality_score, outdoor_score: @daily_questionnaire.outdoor_score, physicality_score: @daily_questionnaire.physicality_score, strength_score: @daily_questionnaire.strength_score, team_score: @daily_questionnaire.team_score, user_mood: @daily_questionnaire.user_mood } }
    end

    assert_redirected_to daily_questionnaire_url(DailyQuestionnaire.last)
  end

  test "should show daily_questionnaire" do
    get daily_questionnaire_url(@daily_questionnaire)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_questionnaire_url(@daily_questionnaire)
    assert_response :success
  end

  test "should update daily_questionnaire" do
    patch daily_questionnaire_url(@daily_questionnaire), params: { daily_questionnaire: { cardio_score: @daily_questionnaire.cardio_score, dayOfWeek: @daily_questionnaire.dayOfWeek, duration_mins: @daily_questionnaire.duration_mins, duration_score: @daily_questionnaire.duration_score, indoor_score: @daily_questionnaire.indoor_score, intensity_score: @daily_questionnaire.intensity_score, mentality_score: @daily_questionnaire.mentality_score, outdoor_score: @daily_questionnaire.outdoor_score, physicality_score: @daily_questionnaire.physicality_score, strength_score: @daily_questionnaire.strength_score, team_score: @daily_questionnaire.team_score, user_mood: @daily_questionnaire.user_mood } }
    assert_redirected_to daily_questionnaire_url(@daily_questionnaire)
  end

  test "should destroy daily_questionnaire" do
    assert_difference('DailyQuestionnaire.count', -1) do
      delete daily_questionnaire_url(@daily_questionnaire)
    end

    assert_redirected_to daily_questionnaires_url
  end
end
