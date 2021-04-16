require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @activity = activities(:one)
  end

  test "visiting the index" do
    visit activities_url
    assert_selector "h1", text: "Activities"
  end

  test "creating a Activity" do
    visit activities_url
    click_on "New Activity"

    fill_in "Cardio score", with: @activity.cardio_score
    fill_in "Duration", with: @activity.duration
    fill_in "Indoor score", with: @activity.indoor_score
    fill_in "Intensity score", with: @activity.intensity_score
    fill_in "Mentality score", with: @activity.mentality_score
    fill_in "Name", with: @activity.name
    fill_in "Outdoor score", with: @activity.outdoor_score
    fill_in "Physicality score", with: @activity.physicality_score
    fill_in "Solo score", with: @activity.solo_score
    fill_in "Strength score", with: @activity.strength_score
    fill_in "Team score", with: @activity.team_score
    click_on "Create Activity"

    assert_text "Activity was successfully created"
    click_on "Back"
  end

  test "updating a Activity" do
    visit activities_url
    click_on "Edit", match: :first

    fill_in "Cardio score", with: @activity.cardio_score
    fill_in "Duration", with: @activity.duration
    fill_in "Indoor score", with: @activity.indoor_score
    fill_in "Intensity score", with: @activity.intensity_score
    fill_in "Mentality score", with: @activity.mentality_score
    fill_in "Name", with: @activity.name
    fill_in "Outdoor score", with: @activity.outdoor_score
    fill_in "Physicality score", with: @activity.physicality_score
    fill_in "Solo score", with: @activity.solo_score
    fill_in "Strength score", with: @activity.strength_score
    fill_in "Team score", with: @activity.team_score
    click_on "Update Activity"

    assert_text "Activity was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity" do
    visit activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity was successfully destroyed"
  end
end
