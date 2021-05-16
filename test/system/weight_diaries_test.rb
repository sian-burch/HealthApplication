require "application_system_test_case"

class WeightDiariesTest < ApplicationSystemTestCase
  setup do
    @weight_diary = weight_diaries(:one)
  end

  test "visiting the index" do
    visit weight_diaries_url
    assert_selector "h1", text: "Weight Diaries"
  end

  test "creating a Weight diary" do
    visit weight_diaries_url
    click_on "New Weight Diary"

    fill_in "Date", with: @weight_diary.date
    fill_in "Weight", with: @weight_diary.weight
    click_on "Create Weight diary"

    assert_text "Weight diary was successfully created"
    click_on "Back"
  end

  test "updating a Weight diary" do
    visit weight_diaries_url
    click_on "Edit", match: :first

    fill_in "Date", with: @weight_diary.date
    fill_in "Weight", with: @weight_diary.weight
    click_on "Update Weight diary"

    assert_text "Weight diary was successfully updated"
    click_on "Back"
  end

  test "destroying a Weight diary" do
    visit weight_diaries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weight diary was successfully destroyed"
  end
end
