class DailyQuestionnairesController < ApplicationController
  before_action :set_daily_questionnaire, only: %i[ show edit update destroy ]

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
    @daily_questionnaire = DailyQuestionnaire.new(daily_questionnaire_params)

    respond_to do |format|
      if @daily_questionnaire.save
        format.html { redirect_to @daily_questionnaire, notice: "Daily questionnaire was successfully created." }
        format.json { render :show, status: :created, location: @daily_questionnaire }
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
