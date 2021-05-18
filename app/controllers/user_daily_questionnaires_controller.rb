class UserDailyQuestionnairesController < ApplicationController
  load_and_authorize_resource
  before_action :set_user_daily_questionnaire, only: %i[ show edit update destroy ]
  before_action :set_today_time, only: %i[ new create ]
  before_action :set_today_location, only: %i[ new create ]
  require 'date'
  require 'net/http'
  require 'json'

  # Function to set the day of week as today's week day
  def set_today_time
    @day_of_week=Date.today.strftime('%A')
  end

  def set_today_location
    if UserDailyQuestionnaire.where(user: current_user).first != nil
      @user_daily_questionnaire=UserDailyQuestionnaire.where(user: current_user).first
      @current_location = @user_daily_questionnaire.location
    end
  end
  # GET /user_daily_questionnaires or /user_daily_questionnaires.json
  def index
    @user_daily_questionnaires = UserDailyQuestionnaire.where(user: current_user).all
  end

  # GET /user_daily_questionnaires/1 or /user_daily_questionnaires/1.json
  def show
  end

  # GET /user_daily_questionnaires/new
  def new
    if $location != nil
      $location = params[:location]
      @location = $location
    end
    @user_daily_questionnaire = UserDailyQuestionnaire.new
  end

  # GET /user_daily_questionnaires/1/edit
  def edit
  end

  # POST /user_daily_questionnaires or /user_daily_questionnaires.json
  def create
    @location_name = params[:location]
    @location = $location
    puts("Location set as " + @location.to_s + " in Change Weather")
    # Initializing current user data as the current user
    
    #when "creating" new DQ we need to take their input but use them as weights to recalculate based on previous DQ
    if UserDailyQuestionnaire.find_by_user_id(current_user.id) != nil
      @user_daily_questionnaire=UserDailyQuestionnaire.find_by_user_id(current_user.id)
      @modifications=UserDailyQuestionnaire.new(user_daily_questionnaire_params)
      @user_daily_questionnaire.day_of_week=Date.today.strftime('%A')
      @user_daily_questionnaire.questionnaire_date=Date.today
      @user_daily_questionnaire.user_mood=@modifications.user_mood
      @user_daily_questionnaire.duration_mins=@modifications.duration_mins
      @user_daily_questionnaire.duration_score=calculate_new_score(@user_daily_questionnaire.duration_score,@modifications.duration_score)
      @user_daily_questionnaire.indoor_score=calculate_new_score(@user_daily_questionnaire.indoor_score,@modifications.indoor_score)
      @user_daily_questionnaire.outdoor_score=calculate_new_score(@user_daily_questionnaire.outdoor_score,@modifications.outdoor_score)
      @user_daily_questionnaire.cardio_score=calculate_new_score(@user_daily_questionnaire.cardio_score,@modifications.cardio_score)
      @user_daily_questionnaire.strength_score=calculate_new_score(@user_daily_questionnaire.strength_score,@modifications.strength_score)
      @user_daily_questionnaire.physicality_score=calculate_new_score(@user_daily_questionnaire.physicality_score,@modifications.physicality_score)
      @user_daily_questionnaire.mentality_score=calculate_new_score(@user_daily_questionnaire.mentality_score,@modifications.mentality_score)
      @user_daily_questionnaire.solo_score=calculate_new_score(@user_daily_questionnaire.solo_score,@modifications.solo_score)
      @user_daily_questionnaire.team_score=calculate_new_score(@user_daily_questionnaire.team_score,@modifications.team_score)
      @user_daily_questionnaire.intensity_score=calculate_new_score(@user_daily_questionnaire.intensity_score,@modifications.intensity_score)
      @modifications.location=@user_daily_questionnaire.location

      respond_to do |format|
        if @user_daily_questionnaire.save

          format.html { redirect_to root_path, notice: "User daily questionnaire was successfully created." }
          format.json { render :show, status: :created, location: @user_daily_questionnaire }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user_daily_questionnaire.errors, status: :unprocessable_entity }
        end
      end
      # Catch - If initial UDQ is deleted by admin and want to create a new one
    else
      @user_daily_questionnaire=UserDailyQuestionnaire.new(user_daily_questionnaire_params)
      @user_daily_questionnaire.user = current_user
      @user_daily_questionnaire.day_of_week=Date.today.strftime('%A')
      @user_daily_questionnaire.questionnaire_date=Date.today
      puts("Current location does not exist before, location passed: " + $location.to_s)
      @user_daily_questionnaire.location = $location
      respond_to do |format|
        if @user_daily_questionnaire.save
          format.html { redirect_to root_path, notice: "User daily questionnaire was successfully created." }
          format.json { render :show, status: :created, location: @user_daily_questionnaire }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user_daily_questionnaire.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /user_daily_questionnaires/1 or /user_daily_questionnaires/1.json
  def update
    respond_to do |format|
      if @user_daily_questionnaire.update(user_daily_questionnaire_params)
        format.html { redirect_to @user_daily_questionnaire, notice: "User daily questionnaire was successfully updated." }
        format.json { render :show, status: :ok, location: @user_daily_questionnaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_daily_questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_daily_questionnaires/1 or /user_daily_questionnaires/1.json
  def destroy
    @user_daily_questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to user_daily_questionnaires_url, notice: "User daily questionnaire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

 def daily_recommendations
    if current_user.user_daily_questionnaire != nil && current_user.user_daily_questionnaire.user_recommendations !=nil
      initial_recs=current_user.user_daily_questionnaire.user_recommendations
      loc=UserDailyQuestionnaire.where(user: current_user, questionnaire_date: Date.today).first.location
      @API_KEY = ENV["API_KEY"]
      @uri = URI("http://api.openweathermap.org/data/2.5/weather?q=#{loc}&appid=#{@API_KEY}")
      @response = JSON.parse(Net::HTTP.get(@uri)) # => String
      @weather_main=@response["weather"][0]["main"].to_s

      puts("main weather:"+@weather_main)
      @recs=[]
      if (@weather_main=='Thunderstorm'||@weather_main=='Rain' || @weather_main=='Snow' || @weather_main=='Dust'||@weather_main=='Sand'|| @weather_main=='Ash'||@weather_main=='Squall'||@weather_main=='Tornado')
        restrictive_weather=true
      else
        restrictive_weather=false
      end
      if restrictive_weather
        initial_recs.each do |rec|
          if rec[:activity].weather_restricted==false #not restricted by weather
            @recs.push(rec)
          end
        end
      else
        @recs=initial_recs
      end
    else
      redirect_to root_path
      flash[:success] = "Please fill in your Daily Questionnaire first before any recommendation is available"
    end
    
  end

  def check_weather
    @userDailyQuestionnaireToday = UserDailyQuestionnaire.where(user: current_user, questionnaire_date: Date.today).first
  end

  def show_weather

    @city_name = params[:city_name_param]
    puts("CityName: '" + @city_name + "'")

    # This will take in city name and other options including API Key
    @API_KEY = ENV["API_KEY"]
    @uri = URI("http://api.openweathermap.org/data/2.5/weather?q=#{@city_name}&appid=#{@API_KEY}")
    @response = JSON.parse(Net::HTTP.get(@uri)) # => String

    puts("URI: " + @uri.to_s)
    puts("API_RESPONSE: " + @response.to_s)
    puts("Weather_Main: " + @response["weather"].to_s)

    if @response["weather"] == nil
      puts("No response")
      redirect_to root_path
      flash[:alert] = "Current city is unavailable for weather searching or API key incorrect"
      return
    elsif UserDailyQuestionnaire.where(user: current_user).first == nil && UserDatum.where(user: current_user).first == nil
      redirect_to new_user_data_path(:location => @city_name)
      flash[:notice] = "Fill in a new user daily questionnaire first"
    elsif UserDailyQuestionnaire.where(user: current_user).first == nil && UserDatum.where(user: current_user).first != nil
      redirect_to new_user_daily_questionnaire_path(:location => @city_name)
      flash[:notice] = "Create a new daily questionnaire first"
    elsif @response["weather"][0]["main"] != nil || @response["weather"] != nil && UserDailyQuestionnaire.where(user: current_user).first != nil
      puts("THIS IF-STATEMENT PASSES")

      @currentUserDailyQuestionnaire = UserDailyQuestionnaire.where(user: current_user).first
      @currentUserDailyQuestionnaire.location = @city_name
      @currentUserDailyQuestionnaire.save
      @currentWeather = @response["weather"][0]["main"]
      redirect_to root_path
      flash[:notice] = "Location set for today's questionnaire"
      return
    else
    end
  end

  # The engine for using API requests, implementing RapidAPI as platform to parse corresponding URL including keys input,
  # into JSON type, if no response, return nil.
  # def request_api(url)
  #   response = Excon.get(url)
  #   return nil if response.status != 200

  #   JSON.parse(response.body)
  # end

  private
    def calculate_new_score(prev_score,modification)
      new_score=0
      case modification
      when 1
        new_score=prev_score-2
      when 2
        new_score=prev_score-1
      when 3
        new_score=prev_score
      when 4
        new_score=prev_score+1
      when 5
        new_score=prev_score+2
      else
        new_score=prev_score
      end

      if new_score<0 || new_score=0
        new_score=1
      elsif new_score>5
        new_score=5
      end

      return new_score
    end
    # Use callbacks to share common setup or constraints between actions.
    # Restrict user to only access its own User Daily Questionnaires, but not others
    def set_user_daily_questionnaire
      @user_daily_questionnaire = UserDailyQuestionnaire.where(user: current_user).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_daily_questionnaire_params
      params.require(:user_daily_questionnaire).permit(:day_of_week, :questionnaire_date, :user_mood, :duration_mins, :duration_score, :indoor_score, :outdoor_score, :cardio_score, :strength_score, :physicality_score, :mentality_score, :solo_score, :team_score, :intensity_score)
    end
end
