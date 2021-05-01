require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end

  test "should get home index" do
    get root_path
    assert_response :success
  end
  test "should get contact" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
    assert_select'h1', 'Contact Us!'
  end

  test 'should post request contact but no email' do
    post request_contact_url
    assert_template :contact
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test 'should post request feedback but no email' do
    post request_feedback_url
    assert_template :feedback
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

end
