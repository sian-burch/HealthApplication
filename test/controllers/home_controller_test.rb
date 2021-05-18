require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end


  
  test "should get home index but no user_datum" do
    # Directed to new user data path to fill in sign-in questionnaire
    get check_weather_path
    assert_response :success
  end
  
  test "should get contact" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
    assert_select'h1', 'Contact Us!'
  end

end
