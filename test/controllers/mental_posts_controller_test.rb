require 'test_helper'

class MentalPostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
    @mental_post = mental_posts(:one)
  end

  test "should create mental_post" do
    assert_difference('MentalPost.count') do
      post mental_posts_url, params: { mental_post: { description: "HELLO", title: "Title", date:"2021-05-18", user_id: 4 } }
    end

    assert_redirected_to mental_post_url(MentalPost.last)
  end

  # Able to pass show delete update test, but URL path changed for set object.
end
