class HomeController < ApplicationController
  before_action :set_user_today, only: %i[ index ]
  skip_before_action :authenticate_user!, only: %i[ privacy_policy disclaimer ]
  skip_before_action :authenticate_user!, only: %i[ cookies ]
  require 'date'
  require 'time'
  
  # Function to set the day of week as today's week day
  def set_user_today
    @dayOfWeek=Date.today.strftime('%A')
    # Variables for showing the pop-ups if they don't exist
    @userDailyQuestionnaireToday = UserDailyQuestionnaire.where(user: current_user, questionnaire_date: Date.today).first
    @userData = UserDatum.where(user: current_user).first
  end

 def index
    # Redirect to create new user data when no user data exists
    if UserDatum.where(user: current_user).first == nil
      redirect_to check_weather_path
    elsif UserDailyQuestionnaire.where(user: current_user).first == nil
      # Remain in root path
      # Fixed redirect_to root path prevent from infinite loop
    elsif UserDailyQuestionnaire.where(user: current_user).first != nil && UserDailyQuestionnaire.where(user: current_user).first.location != nil
      # Set today's location as UDQ's location
      @locationToday = UserDailyQuestionnaire.where(user: current_user).first.location
    end
    # gem "gon" is used to be assigned with variable from controller to javascript
    gon.UserData = UserDatum.where(user: current_user).first
    gon.UserDailyQuestionnaire = UserDailyQuestionnaire.where(user: current_user).first
  end

  def about
  end

  def contact
  end

  def feedback
  end

  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    # Regex for validating email
    emailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # If email and telephone syntax match regex
    if (email.match(emailRegex).nil?) == false
    # Deliver Email with parameters and email format
      UserMailer.feedback_form(email,name,telephone,feedback).deliver_now
      flash[:notice] = I18n.t('emailSent')
    # Redirect back to home page after email is sent
      redirect_to root_path
    # If email field is blank
    elsif email.blank?
    # Flash alert notification
      flash.now[:alert] = I18n.t('emailNotEmpty')
    # Do not redirect, but render this contact view again
      render "contact"
    else
      flash.now[:alert] = I18n.t('emailSyntaxError')
      render "contact"
    end
    
  end

  def request_feedback
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    feedback = params[:feedback]

    # Regex for validating email
    emailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # If email and telephone syntax match regex
    if (email.match(emailRegex).nil?) == false
      UserMailer.feedback_form(email,name,telephone,feedback).deliver_now
      flash[:notice] = I18n.t('emailSent')
      redirect_to root_path
    elsif email.blank?
      flash.now[:alert] = I18n.t('emailNotEmpty')
      render "feedback"
    else
      flash.now[:alert] = I18n.t('emailSyntaxError')
      render "feedback"
    end
  end

end
