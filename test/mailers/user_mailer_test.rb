require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  test "Should return contact email" do
    
    mail = UserMailer.contact_form("example@me.com", "Me", "7712345678", @message = "Hello, this is a test message")

    assert_equal ['healthapplication2021@gmail.com'], mail.to
    assert_equal ['healthapplication2021@gmail.com'], mail.from

  end

  test "Should return feedback email" do
    
    mail = UserMailer.feedback_form("example@me.com", "Me", "7712345678", @feedback = "Hello, this is a test feedback")

    assert_equal ['healthapplication2021@gmail.com'], mail.to
    assert_equal ['healthapplication2021@gmail.com'], mail.from
    
  end

end
