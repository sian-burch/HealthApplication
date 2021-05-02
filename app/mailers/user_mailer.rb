class UserMailer < ApplicationMailer

    layout 'mailer'

    def contact_form(email, name, telephone, message)

        @email = email
        @name = name
        @telephone = telephone
        @message = message

        mail( :to => 'Healthapplicationproject@gmail.com',
            :subject => 'Contact messages' )

        mail cc:@email
    end

    def feedback_form(email, name, telephone, feedback)

        @email = email
        @name = name
        @telephone = telephone
        @feedback = feedback

        mail( :to => 'Healthapplicationproject@gmail.com',
            :subject => 'Feedback messages' )
            
        mail cc:@email

    end

    default :from => 'Healthapplicationproject@gmail.com'


end
