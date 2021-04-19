require 'test_helper'

class UserFeedbackQuestionnairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_feedback_questionnaire = user_feedback_questionnaires(:one)
  end

  test "should get index" do
    get user_feedback_questionnaires_url
    assert_response :success
  end

  test "should get new" do
    get new_user_feedback_questionnaire_url
    assert_response :success
  end

  test "should create user_feedback_questionnaire" do
    assert_difference('UserFeedbackQuestionnaire.count') do
      post user_feedback_questionnaires_url, params: { user_feedback_questionnaire: {  } }
    end

    assert_redirected_to user_feedback_questionnaire_url(UserFeedbackQuestionnaire.last)
  end

  test "should show user_feedback_questionnaire" do
    get user_feedback_questionnaire_url(@user_feedback_questionnaire)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_feedback_questionnaire_url(@user_feedback_questionnaire)
    assert_response :success
  end

  test "should update user_feedback_questionnaire" do
    patch user_feedback_questionnaire_url(@user_feedback_questionnaire), params: { user_feedback_questionnaire: {  } }
    assert_redirected_to user_feedback_questionnaire_url(@user_feedback_questionnaire)
  end

  test "should destroy user_feedback_questionnaire" do
    assert_difference('UserFeedbackQuestionnaire.count', -1) do
      delete user_feedback_questionnaire_url(@user_feedback_questionnaire)
    end

    assert_redirected_to user_feedback_questionnaires_url
  end
end
