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

    fill_in "Cardio score", with: @user_daily_questionnaire.cardio_score
    fill_in "Day of week", with: @user_daily_questionnaire.day_of_week
    fill_in "Duration mins", with: @user_daily_questionnaire.duration_mins
    fill_in "Duration score", with: @user_daily_questionnaire.duration_score
    fill_in "Indoor score", with: @user_daily_questionnaire.indoor_score
    fill_in "Intensity score", with: @user_daily_questionnaire.intensity_score
    fill_in "Mentality score", with: @user_daily_questionnaire.mentality_score
    fill_in "Outdoor score", with: @user_daily_questionnaire.outdoor_score
    fill_in "Physicality score", with: @user_daily_questionnaire.physicality_score
    fill_in "Questionnaire date", with: @user_daily_questionnaire.questionnaire_date
    fill_in "Solo score", with: @user_daily_questionnaire.solo_score
    fill_in "Strength score", with: @user_daily_questionnaire.strength_score
    fill_in "Team score", with: @user_daily_questionnaire.team_score
    fill_in "User mood", with: @user_daily_questionnaire.user_mood
    click_on "Create User daily questionnaire"

    assert_text "User daily questionnaire was successfully created"
    click_on "Back"
  end

  test "updating a User daily questionnaire" do
    visit user_daily_questionnaires_url
    click_on "Edit", match: :first

    fill_in "Cardio score", with: @user_daily_questionnaire.cardio_score
    fill_in "Day of week", with: @user_daily_questionnaire.day_of_week
    fill_in "Duration mins", with: @user_daily_questionnaire.duration_mins
    fill_in "Duration score", with: @user_daily_questionnaire.duration_score
    fill_in "Indoor score", with: @user_daily_questionnaire.indoor_score
    fill_in "Intensity score", with: @user_daily_questionnaire.intensity_score
    fill_in "Mentality score", with: @user_daily_questionnaire.mentality_score
    fill_in "Outdoor score", with: @user_daily_questionnaire.outdoor_score
    fill_in "Physicality score", with: @user_daily_questionnaire.physicality_score
    fill_in "Questionnaire date", with: @user_daily_questionnaire.questionnaire_date
    fill_in "Solo score", with: @user_daily_questionnaire.solo_score
    fill_in "Strength score", with: @user_daily_questionnaire.strength_score
    fill_in "Team score", with: @user_daily_questionnaire.team_score
    fill_in "User mood", with: @user_daily_questionnaire.user_mood
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
