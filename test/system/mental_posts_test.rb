require "application_system_test_case"

class MentalPostsTest < ApplicationSystemTestCase
  setup do
    @mental_post = mental_posts(:one)
  end

  test "visiting the index" do
    visit mental_posts_url
    assert_selector "h1", text: "Mental Posts"
  end

  test "creating a Mental post" do
    visit mental_posts_url
    click_on "New Mental Post"

    fill_in "Description", with: @mental_post.description
    fill_in "Title", with: @mental_post.title
    fill_in "User", with: @mental_post.user_id
    click_on "Create Mental post"

    assert_text "Mental post was successfully created"
    click_on "Back"
  end

  test "updating a Mental post" do
    visit mental_posts_url
    click_on "Edit", match: :first

    fill_in "Description", with: @mental_post.description
    fill_in "Title", with: @mental_post.title
    fill_in "User", with: @mental_post.user_id
    click_on "Update Mental post"

    assert_text "Mental post was successfully updated"
    click_on "Back"
  end

  test "destroying a Mental post" do
    visit mental_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mental post was successfully destroyed"
  end
end
