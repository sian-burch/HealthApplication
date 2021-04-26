class FeedbackQuestionnairesController < ApplicationController
  before_action :set_feedback_questionnaire, only: %i[ show edit update destroy ]
  before_action :set_today_time
  require 'date'

  # Function to set the day of week as today's week day
  def set_today_time
    @dayOfWeek=Date.today.strftime('%A')
  end

  # GET /feedback_questionnaires or /feedback_questionnaires.json
  def index
    @feedback_questionnaires = FeedbackQuestionnaire.all
  end

  # GET /feedback_questionnaires/1 or /feedback_questionnaires/1.json
  def show
  end

  # GET /feedback_questionnaires/new
  def new
    @feedback_questionnaire = FeedbackQuestionnaire.new
  end

  # GET /feedback_questionnaires/1/edit
  def edit
  end

  # POST /feedback_questionnaires or /feedback_questionnaires.json
  # Creating and saving new feedback questionnaire should cause a new instance of user_feedback_questionnaire to be created
  # and every fields to be set up correctly for information of that day
  def create
    # Initializing current user data as the current user
    @currentUserData = UserDatum.user_user_data(current_user)
    # A new feedback questionnaire to be created and its day of week field being set to the time using date
    @feedback_questionnaire = FeedbackQuestionnaire.new(feedback_questionnaire_params)
    @feedback_questionnaire.dayOfWeek=@dayOfWeek

    respond_to do |format|
      if @feedback_questionnaire.save
        # If a daily questionnaire is created and saved
        # Create a new user_daily_questionnaire instance and set all its fields to be associated with user
        @new_User_Feedback_Questionnaire = UserFeedbackQuestionnaire.new(questionnaireDate: Date.today, user_data: @currentUserData, user_datum_id: @currentUserData.ids.first, feedback_questionnaire_id:@feedback_questionnaire.id)
        # Save the created user_daily_questionnaire
        @new_User_Feedback_Questionnaire.save
        # Set the association of the created user_daily_questionnaire and daily_questionnaire
        @feedback_questionnaire.user_feedback_questionnaire=@new_User_Feedback_Questionnaire
        @feedback_questionnaire.save
        # Redirect back to root path after new feedback questionnaire is created
        format.html { redirect_to root_path, notice: "Feedback questionnaire was successfully created." }
        format.json { render :show, status: :created, location: @feedback_questionnaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feedback_questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedback_questionnaires/1 or /feedback_questionnaires/1.json
  def update
    respond_to do |format|
      if @feedback_questionnaire.update(feedback_questionnaire_params)
        format.html { redirect_to @feedback_questionnaire, notice: "Feedback questionnaire was successfully updated." }
        format.json { render :show, status: :ok, location: @feedback_questionnaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feedback_questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_questionnaires/1 or /feedback_questionnaires/1.json
  def destroy
    @feedback_questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to feedback_questionnaires_url, notice: "Feedback questionnaire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_questionnaire
      @feedback_questionnaire = FeedbackQuestionnaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_questionnaire_params
      params.require(:feedback_questionnaire).permit(:dayOfWeek, :user_satisfaction, :soreness_level)
    end
end
