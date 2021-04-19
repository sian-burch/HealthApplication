require "application_system_test_case"

class UserFeedbackQuestionnairesTest < ApplicationSystemTestCase
  setup do
    @user_feedback_questionnaire = user_feedback_questionnaires(:one)
  end

  test "visiting the index" do
    visit user_feedback_questionnaires_url
    assert_selector "h1", text: "User Feedback Questionnaires"
  end

  test "creating a User feedback questionnaire" do
    visit user_feedback_questionnaires_url
    click_on "New User Feedback Questionnaire"

    click_on "Create User feedback questionnaire"

    assert_text "User feedback questionnaire was successfully created"
    click_on "Back"
  end

  test "updating a User feedback questionnaire" do
    visit user_feedback_questionnaires_url
    click_on "Edit", match: :first

    click_on "Update User feedback questionnaire"

    assert_text "User feedback questionnaire was successfully updated"
    click_on "Back"
  end

  test "destroying a User feedback questionnaire" do
    visit user_feedback_questionnaires_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User feedback questionnaire was successfully destroyed"
  end
end
