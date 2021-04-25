require "application_system_test_case"

class DailyQuestionnairesTest < ApplicationSystemTestCase
  setup do
    @daily_questionnaire = daily_questionnaires(:one)
  end

  test "visiting the index" do
    visit daily_questionnaires_url
    assert_selector "h1", text: "Daily Questionnaires"
  end

  test "creating a Daily questionnaire" do
    visit daily_questionnaires_url
    click_on "New Daily Questionnaire"

    fill_in "Cardio score", with: @daily_questionnaire.cardio_score
    fill_in "Dayofweek", with: @daily_questionnaire.dayOfWeek
    fill_in "Duration mins", with: @daily_questionnaire.duration_mins
    fill_in "Duration score", with: @daily_questionnaire.duration_score
    fill_in "Indoor score", with: @daily_questionnaire.indoor_score
    fill_in "Intensity score", with: @daily_questionnaire.intensity_score
    fill_in "Mentality score", with: @daily_questionnaire.mentality_score
    fill_in "Outdoor score", with: @daily_questionnaire.outdoor_score
    fill_in "Physicality score", with: @daily_questionnaire.physicality_score
    fill_in "Strength score", with: @daily_questionnaire.strength_score
    fill_in "Team score", with: @daily_questionnaire.team_score
    fill_in "User mood", with: @daily_questionnaire.user_mood
    click_on "Create Daily questionnaire"

    assert_text "Daily questionnaire was successfully created"
    click_on "Back"
  end

  test "updating a Daily questionnaire" do
    visit daily_questionnaires_url
    click_on "Edit", match: :first

    fill_in "Cardio score", with: @daily_questionnaire.cardio_score
    fill_in "Dayofweek", with: @daily_questionnaire.dayOfWeek
    fill_in "Duration mins", with: @daily_questionnaire.duration_mins
    fill_in "Duration score", with: @daily_questionnaire.duration_score
    fill_in "Indoor score", with: @daily_questionnaire.indoor_score
    fill_in "Intensity score", with: @daily_questionnaire.intensity_score
    fill_in "Mentality score", with: @daily_questionnaire.mentality_score
    fill_in "Outdoor score", with: @daily_questionnaire.outdoor_score
    fill_in "Physicality score", with: @daily_questionnaire.physicality_score
    fill_in "Strength score", with: @daily_questionnaire.strength_score
    fill_in "Team score", with: @daily_questionnaire.team_score
    fill_in "User mood", with: @daily_questionnaire.user_mood
    click_on "Update Daily questionnaire"

    assert_text "Daily questionnaire was successfully updated"
    click_on "Back"
  end

  test "destroying a Daily questionnaire" do
    visit daily_questionnaires_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Daily questionnaire was successfully destroyed"
  end
end
