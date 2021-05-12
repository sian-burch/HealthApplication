# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

    def contact_form
        UserMailer.contact_form("example@me.com", "Me", "7712345678", @message = "Hello, this is a test message")
    end

    def feedback_form
        UserMailer.feedback_form("example@me.com", "Me", "7712345678", @feedback = "Hello, this is a test feedback")
    end

end
