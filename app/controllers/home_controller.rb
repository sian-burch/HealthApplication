class HomeController < ApplicationController
  before_action :set_today_time
  require 'date'
  require 'time'
  
  # Function to set the day of week as today's week day
  def set_today_time
    @dayOfWeek=Date.today.strftime('%A')
    @currentTime=Time.zone.now.strftime("%H:%M:%S")
  end

  def index
    # Variables for showing the pop-ups if they don't exist
    @currentUserData = UserDatum.user_user_data(current_user)
    @userDailyQuestionnaireToday = UserDailyQuestionnaire.where(user_datum_id: @currentUserData.ids.first, questionnaireDate:Date.today)

    @userFeedbackQuestionnaireToday = UserFeedbackQuestionnaire.where(user_datum_id: @currentUserData.ids.first, questionnaireDate:Date.today)
  end

  def about
  end

end
