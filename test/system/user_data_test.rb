require "application_system_test_case"

class UserDataTest < ApplicationSystemTestCase
  setup do
    @user_datum = user_data(:one)
  end

  test "visiting the index" do
    visit user_data_url
    assert_selector "h1", text: "User Data"
  end

  test "creating a User datum" do
    visit user_data_url
    click_on "New User Datum"

    fill_in "Bmi", with: @user_datum.BMI
    fill_in "Age", with: @user_datum.age
    fill_in "Athletic lvl", with: @user_datum.athletic_lvl
    fill_in "Duration pref", with: @user_datum.duration_pref
    fill_in "Frequency pref", with: @user_datum.frequency_pref
    fill_in "Gender", with: @user_datum.gender
    fill_in "Height", with: @user_datum.height
    fill_in "Indoor", with: @user_datum.indoor
    fill_in "Meditation", with: @user_datum.meditation
    check "Mental" if @user_datum.mental
    fill_in "Outdoor", with: @user_datum.outdoor
    check "Physical" if @user_datum.physical
    fill_in "Running", with: @user_datum.running
    fill_in "Walking", with: @user_datum.walking
    fill_in "Weight", with: @user_datum.weight
    click_on "Create User datum"

    assert_text "User datum was successfully created"
    click_on "Back"
  end

  test "updating a User datum" do
    visit user_data_url
    click_on "Edit", match: :first

    fill_in "Bmi", with: @user_datum.BMI
    fill_in "Age", with: @user_datum.age
    fill_in "Athletic lvl", with: @user_datum.athletic_lvl
    fill_in "Duration pref", with: @user_datum.duration_pref
    fill_in "Frequency pref", with: @user_datum.frequency_pref
    fill_in "Gender", with: @user_datum.gender
    fill_in "Height", with: @user_datum.height
    fill_in "Indoor", with: @user_datum.indoor
    fill_in "Meditation", with: @user_datum.meditation
    check "Mental" if @user_datum.mental
    fill_in "Outdoor", with: @user_datum.outdoor
    check "Physical" if @user_datum.physical
    fill_in "Running", with: @user_datum.running
    fill_in "Walking", with: @user_datum.walking
    fill_in "Weight", with: @user_datum.weight
    click_on "Update User datum"

    assert_text "User datum was successfully updated"
    click_on "Back"
  end

  test "destroying a User datum" do
    visit user_data_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User datum was successfully destroyed"
  end
end
