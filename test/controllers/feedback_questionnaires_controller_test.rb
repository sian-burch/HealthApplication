require 'test_helper'

class FeedbackQuestionnairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedback_questionnaire = feedback_questionnaires(:one)
  end

  test "should get index" do
    get feedback_questionnaires_url
    assert_response :success
  end

  test "should get new" do
    get new_feedback_questionnaire_url
    assert_response :success
  end

  test "should create feedback_questionnaire" do
    assert_difference('FeedbackQuestionnaire.count') do
      post feedback_questionnaires_url, params: { feedback_questionnaire: { soreness_level: @feedback_questionnaire.soreness_level, user_satisfaction: @feedback_questionnaire.user_satisfaction } }
    end

    assert_redirected_to feedback_questionnaire_url(FeedbackQuestionnaire.last)
  end

  test "should show feedback_questionnaire" do
    get feedback_questionnaire_url(@feedback_questionnaire)
    assert_response :success
  end

  test "should get edit" do
    get edit_feedback_questionnaire_url(@feedback_questionnaire)
    assert_response :success
  end

  test "should update feedback_questionnaire" do
    patch feedback_questionnaire_url(@feedback_questionnaire), params: { feedback_questionnaire: { soreness_level: @feedback_questionnaire.soreness_level, user_satisfaction: @feedback_questionnaire.user_satisfaction } }
    assert_redirected_to feedback_questionnaire_url(@feedback_questionnaire)
  end

  test "should destroy feedback_questionnaire" do
    assert_difference('FeedbackQuestionnaire.count', -1) do
      delete feedback_questionnaire_url(@feedback_questionnaire)
    end

    assert_redirected_to feedback_questionnaires_url
  end
end
