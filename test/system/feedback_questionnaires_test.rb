require "application_system_test_case"

class FeedbackQuestionnairesTest < ApplicationSystemTestCase
  setup do
    @feedback_questionnaire = feedback_questionnaires(:one)
  end

  test "visiting the index" do
    visit feedback_questionnaires_url
    assert_selector "h1", text: "Feedback Questionnaires"
  end

  test "creating a Feedback questionnaire" do
    visit feedback_questionnaires_url
    click_on "New Feedback Questionnaire"

    fill_in "Soreness level", with: @feedback_questionnaire.soreness_level
    fill_in "User satisfaction", with: @feedback_questionnaire.user_satisfaction
    click_on "Create Feedback questionnaire"

    assert_text "Feedback questionnaire was successfully created"
    click_on "Back"
  end

  test "updating a Feedback questionnaire" do
    visit feedback_questionnaires_url
    click_on "Edit", match: :first

    fill_in "Soreness level", with: @feedback_questionnaire.soreness_level
    fill_in "User satisfaction", with: @feedback_questionnaire.user_satisfaction
    click_on "Update Feedback questionnaire"

    assert_text "Feedback questionnaire was successfully updated"
    click_on "Back"
  end

  test "destroying a Feedback questionnaire" do
    visit feedback_questionnaires_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Feedback questionnaire was successfully destroyed"
  end
end
