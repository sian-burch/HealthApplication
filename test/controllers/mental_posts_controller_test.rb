require 'test_helper'

class MentalPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mental_post = mental_posts(:one)
  end

  test "should get index" do
    get mental_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_mental_post_url
    assert_response :success
  end

  test "should create mental_post" do
    assert_difference('MentalPost.count') do
      post mental_posts_url, params: { mental_post: { description: @mental_post.description, title: @mental_post.title, user_id: @mental_post.user_id } }
    end

    assert_redirected_to mental_post_url(MentalPost.last)
  end

  test "should show mental_post" do
    get mental_post_url(@mental_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_mental_post_url(@mental_post)
    assert_response :success
  end

  test "should update mental_post" do
    patch mental_post_url(@mental_post), params: { mental_post: { description: @mental_post.description, title: @mental_post.title, user_id: @mental_post.user_id } }
    assert_redirected_to mental_post_url(@mental_post)
  end

  test "should destroy mental_post" do
    assert_difference('MentalPost.count', -1) do
      delete mental_post_url(@mental_post)
    end

    assert_redirected_to mental_posts_url
  end
end
