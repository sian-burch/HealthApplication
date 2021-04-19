require 'test_helper'

class UserDailyQuestionnairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_daily_questionnaire = user_daily_questionnaires(:one)
  end

  test "should get index" do
    get user_daily_questionnaires_url
    assert_response :success
  end

  test "should get new" do
    get new_user_daily_questionnaire_url
    assert_response :success
  end

  test "should create user_daily_questionnaire" do
    assert_difference('UserDailyQuestionnaire.count') do
      post user_daily_questionnaires_url, params: { user_daily_questionnaire: { questionnaireDate: @user_daily_questionnaire.questionnaireDate } }
    end

    assert_redirected_to user_daily_questionnaire_url(UserDailyQuestionnaire.last)
  end

  test "should show user_daily_questionnaire" do
    get user_daily_questionnaire_url(@user_daily_questionnaire)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_daily_questionnaire_url(@user_daily_questionnaire)
    assert_response :success
  end

  test "should update user_daily_questionnaire" do
    patch user_daily_questionnaire_url(@user_daily_questionnaire), params: { user_daily_questionnaire: { questionnaireDate: @user_daily_questionnaire.questionnaireDate } }
    assert_redirected_to user_daily_questionnaire_url(@user_daily_questionnaire)
  end

  test "should destroy user_daily_questionnaire" do
    assert_difference('UserDailyQuestionnaire.count', -1) do
      delete user_daily_questionnaire_url(@user_daily_questionnaire)
    end

    assert_redirected_to user_daily_questionnaires_url
  end
end
