require "application_system_test_case"

class RecommendedDailyStepsTest < ApplicationSystemTestCase
  setup do
    @recommended_daily_step = recommended_daily_steps(:one)
  end

  test "visiting the index" do
    visit recommended_daily_steps_url
    assert_selector "h1", text: "Recommended Daily Steps"
  end

  test "creating a Recommended daily step" do
    visit recommended_daily_steps_url
    click_on "New Recommended Daily Step"

    fill_in "Age", with: @recommended_daily_step.age
    fill_in "High", with: @recommended_daily_step.high
    fill_in "Medium", with: @recommended_daily_step.medium
    fill_in "Minimum", with: @recommended_daily_step.minimum
    click_on "Create Recommended daily step"

    assert_text "Recommended daily step was successfully created"
    click_on "Back"
  end

  test "updating a Recommended daily step" do
    visit recommended_daily_steps_url
    click_on "Edit", match: :first

    fill_in "Age", with: @recommended_daily_step.age
    fill_in "High", with: @recommended_daily_step.high
    fill_in "Medium", with: @recommended_daily_step.medium
    fill_in "Minimum", with: @recommended_daily_step.minimum
    click_on "Update Recommended daily step"

    assert_text "Recommended daily step was successfully updated"
    click_on "Back"
  end

  test "destroying a Recommended daily step" do
    visit recommended_daily_steps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recommended daily step was successfully destroyed"
  end
end
