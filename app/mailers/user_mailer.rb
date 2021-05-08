class UserMailer < ApplicationMailer

    layout 'mailer'

    def contact_form(email, name, telephone, message)

        @email = email
        @name = name
        @telephone = telephone
        @message = message

        mail( :to => 'healthapplication2021@gmail.com',
            :subject => 'Contact messages' )

        # Option to send a hard copy to user email when sending to website email
        mail cc:@email
    end

    def feedback_form(email, name, telephone, feedback)

        @email = email
        @name = name
        @telephone = telephone
        @feedback = feedback

        mail( :to => 'healthapplication2021@gmail.com',
            :subject => 'Feedback messages' )

        # Option to send a hard copy to user email when sending to website email
        mail cc:@email

    end

    default :from => 'healthapplication2021@gmail.com'

end
