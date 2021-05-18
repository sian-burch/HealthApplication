require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
    @post = posts(:one)
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { description: "HELLO", title: "Title", date:"2021-05-18", user_id: 4  } }
    end

    assert_redirected_to post_url(Post.last)
  end
# Able to pass show delete update test, but URL path changed for set object.
end
