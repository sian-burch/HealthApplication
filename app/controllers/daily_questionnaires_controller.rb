class DailyQuestionnairesController < ApplicationController
  before_action :set_daily_questionnaire, only: %i[ show edit update destroy ]
  require 'date'
  
  # GET /daily_questionnaires or /daily_questionnaires.json
  def index
    @daily_questionnaires = DailyQuestionnaire.all
  end

  # GET /daily_questionnaires/1 or /daily_questionnaires/1.json
  def show
  end

  # GET /daily_questionnaires/new
  def new
    @daily_questionnaire = DailyQuestionnaire.new
  end

  # GET /daily_questionnaires/1/edit
  def edit
  end

  # POST /daily_questionnaires or /daily_questionnaires.json
  def create
    @currentUserData = UserDatum.user_user_data(current_user)
    @daily_questionnaire = DailyQuestionnaire.new(daily_questionnaire_params)
    @daily_questionnaire.dayOfWeek=Date.today.strftime('%A')
    respond_to do |format|
      if @daily_questionnaire.save
        format.html { redirect_to root_path, notice: "Daily questionnaire was successfully created." }
        format.json { render :show, status: :created, location: @daily_questionnaire }
        new_User_Daily_Questionnaire = UserDailyQuestionnaire.new(questionnaireDate: Date.today, user_data: @currentUserData, user_datum_id: @currentUserData.ids.first)
        new_User_Daily_Questionnaire.save!
        @daily_questionnaire.user_daily_questionnaires=[new_User_Daily_Questionnaire]
        @daily_questionnaire.user_daily_questionnaire_id=new_User_Daily_Questionnaire.id
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_questionnaires/1 or /daily_questionnaires/1.json
  def update
    respond_to do |format|
      if @daily_questionnaire.update(daily_questionnaire_params)
        format.html { redirect_to @daily_questionnaire, notice: "Daily questionnaire was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_questionnaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_questionnaires/1 or /daily_questionnaires/1.json
  def destroy
    @daily_questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to daily_questionnaires_url, notice: "Daily questionnaire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_questionnaire
      @daily_questionnaire = DailyQuestionnaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_questionnaire_params
      params.require(:daily_questionnaire).permit(:dayOfWeek, :user_mood, :duration_mins, :indoor_score, :outdoor_score, :cardio_score, :strength_score, :physicality_score, :mentality_score, :solo_score, :team_score, :intensity_score, :duration_score)
    end
end
