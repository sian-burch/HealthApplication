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
    # BEFORE MODIFYING
    # @user_daily_questionnaire = UserDailyQuestionnaire.new(user_daily_questionnaire_params)
    # @user_daily_questionnaire.day_of_week = @day_of_week
    # @user_daily_questionnaire.questionnaire_date = Date.today
    # @user_daily_questionnaire.user = current_user
    #when "creating" new DQ we need to take their input but use them as weights to recalculate based on previous DQ
    #make "create" behave like "update"
    
    
    @user_daily_questionnaire=UserDailyQuestionnaire.find_by_user_id(current_user.id)
    @modifications=UserDailyQuestionnaire.new(user_daily_questionnaire_params)
    #@user_daily_questionnaire=UserDailyQuestionnaire.new
    #DQ.user_id=current_user.id #possibly not needed?
    @user_daily_questionnaire.day_of_week=@day_of_week
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

      if new_score<0
        new_score=0
      elsif new_score>5
        new_score=5
      end

      return new_score      
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user_daily_questionnaire
      @user_daily_questionnaire = UserDailyQuestionnaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_daily_questionnaire_params
      params.require(:user_daily_questionnaire).permit(:day_of_week, :questionnaire_date, :user_mood, :duration_mins, :duration_score, :indoor_score, :outdoor_score, :cardio_score, :strength_score, :physicality_score, :mentality_score, :solo_score, :team_score, :intensity_score)
    end
end
