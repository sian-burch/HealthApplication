class HomeController < ApplicationController
  before_action :set_user_today, only: %i[ index ]
  require 'date'
  require 'time'
  
  # Function to set the day of week as today's week day
  def set_user_today
    @dayOfWeek=Date.today.strftime('%A')
    # Variables for showing the pop-ups if they don't exist
    @userDailyQuestionnaireToday = UserDailyQuestionnaire.where(user: current_user, questionnaire_date: Date.today).first
  end

  def index
    # @user_datum = UserDatum.where(user:current_user).first
    # if UserDailyQuestionnaire.where(user: current_user).first == nil && @user_datum !=nil
    #   puts("IFSUCCESSFUL")
    #   redirect_to createInitialUDQ_path and return
    # end
  end

  def about
  end

end
