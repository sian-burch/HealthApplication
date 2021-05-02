class HomeController < ApplicationController
  before_action :set_user_today, only: %i[ index ]
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
      redirect_to new_user_data_path
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

    # Regex for validating telephone
    telephoneRegex = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/

    # If email and telephone syntax match regex
    if (email.match(emailRegex).nil?) == false && (telephone.match(telephoneRegex).nil?) == false
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
    # If telephone syntax does not match regex
    elsif (telephone.match(telephoneRegex).nil?) == true
    # Flash alert notification
      flash.now[:alert] = I18n.t('telephoneSyntaxError')
    # Do not redirect, but render this contact view again
      render "contact"
    # Email syntax error
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

    # Regex for validating telephone
    telephoneRegex = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/

    # If email and telephone syntax match regex
    if (email.match(emailRegex).nil?) == false && (telephone.match(telephoneRegex).nil?) == false
      UserMailer.feedback_form(email,name,telephone,feedback).deliver_now
      flash[:notice] = I18n.t('emailSent')
      redirect_to root_path
    elsif email.blank?
      flash.now[:alert] = I18n.t('emailNotEmpty')
      render "feedback"
    # If telephone does not  match regex
    elsif (telephone.match(telephoneRegex).nil?) == true
      flash.now[:alert] = I18n.t('telephoneSyntaxError')
      render "feedback"
    else
      flash.now[:alert] = I18n.t('emailSyntaxError')
      render "feedback"
    end
  end
end
