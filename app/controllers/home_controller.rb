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

    if email.blank?
      flash.now[:alert] = I18n.t('emailNotEmpty')
      render "contact"
    else
      flash[:notice] = I18n.t('email_sent')
      redirect_to root_path
    end
    
  end

  def request_feedback
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    feedback = params[:feedback]

    if email.blank?
      flash.now[:alert] = I18n.t('emailNotEmpty')
      render "feedback"
    else
      flash[:notice] = I18n.t('email_sent')
      redirect_to root_path
    end
  end
end
