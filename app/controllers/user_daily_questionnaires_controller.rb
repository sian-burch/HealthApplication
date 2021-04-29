class UserDailyQuestionnairesController < ApplicationController
  before_action :set_user_daily_questionnaire, only: %i[ show edit update destroy ]
  before_action :set_today_time
  require 'date'

    
  # Function to set the day of week as today's week day
  def set_today_time
    @day_of_week=Date.today.strftime('%A')
  end

  # GET /user_daily_questionnaires or /user_daily_questionnaires.json
  def index
    @user_daily_questionnaires = UserDailyQuestionnaire.all
  end

  # GET /user_daily_questionnaires/1 or /user_daily_questionnaires/1.json
  def show
  end

  # GET /user_daily_questionnaires/new
  def new
    @user_daily_questionnaire = UserDailyQuestionnaire.new
  end

  # GET /user_daily_questionnaires/1/edit
  def edit
  end
  
  # POST /user_daily_questionnaires or /user_daily_questionnaires.json
  def create
    # Initializing current user data as the current user
    @user_daily_questionnaire = UserDailyQuestionnaire.new(user_daily_questionnaire_params)
    @user_daily_questionnaire.day_of_week = @day_of_week
    @user_daily_questionnaire.questionnaire_date = Date.today
    @user_daily_questionnaire.user = current_user

    respond_to do |format|
      if @user_daily_questionnaire.save

# ----------
        # This part should be recommendation algorithm calculating new scores (temporary questionnaire)
        # by putting in (the scores @daily_questionnaire just filled in by user),
        # (the weight values from previous feedback questionnaire's attributes) and 
        # (base scores from sign-up questionnaire).

        # end
        # ----------
        # This part should be updating (replacing) the new score values calculated from (temporary questionnaire)
        # to the (@daily_questionnaire). So that @daily_questionnaire will be updated each day with only one instance
        # for each user, rather than a new instance created each day for each user.

        # @daily_questionnaire.update_attribute(:user_mood, 5)
        # @daily_questionnaire.update_attribute(:indoor_score, 5)
        # @daily_questionnaire.update_attribute(:outdoor_score, 5)
        # @daily_questionnaire.save
        
        # end
        # ----------
        # This part should be updating (replacing) the new date field of user_daily_questionnaire

        
        # end
        # ----------

        format.html { redirect_to root_path, notice: "User daily questionnaire was successfully created." }
        format.json { render :show, status: :created, location: @user_daily_questionnaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_daily_questionnaire.errors, status: :unprocessable_entity }
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
    @recs=current_user.user_daily_questionnaire.user_recommendations
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_daily_questionnaire
      @user_daily_questionnaire = UserDailyQuestionnaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_daily_questionnaire_params
      params.require(:user_daily_questionnaire).permit(:day_of_week, :questionnaire_date, :user_mood, :duration_mins, :duration_score, :indoor_score, :outdoor_score, :cardio_score, :strength_score, :physicality_score, :mentality_score, :solo_score, :team_score, :intensity_score)
    end
end
