require "application_system_test_case"

class UserDailyQuestionnairesTest < ApplicationSystemTestCase
  setup do
    @user_daily_questionnaire = user_daily_questionnaires(:one)
  end

  test "visiting the index" do
    visit user_daily_questionnaires_url
    assert_selector "h1", text: "User Daily Questionnaires"
  end

  test "creating a User daily questionnaire" do
    visit user_daily_questionnaires_url
    click_on "New User Daily Questionnaire"

    fill_in "Questionnairedate", with: @user_daily_questionnaire.questionnaireDate
    click_on "Create User daily questionnaire"

    assert_text "User daily questionnaire was successfully created"
    click_on "Back"
  end

  test "updating a User daily questionnaire" do
    visit user_daily_questionnaires_url
    click_on "Edit", match: :first

    fill_in "Questionnairedate", with: @user_daily_questionnaire.questionnaireDate
    click_on "Update User daily questionnaire"

    assert_text "User daily questionnaire was successfully updated"
    click_on "Back"
  end

  test "destroying a User daily questionnaire" do
    visit user_daily_questionnaires_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User daily questionnaire was successfully destroyed"
  end
end
