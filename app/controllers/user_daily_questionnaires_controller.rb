class UserDailyQuestionnairesController < ApplicationController
  before_action :set_user_daily_questionnaire, only: %i[ show edit update destroy ]

  # GET /user_daily_questionnaires or /user_daily_questionnaires.json
  def index
    # Restrict user's daily questionnaires index view on current user's questionnaires
    @currentUserData = UserDatum.user_user_data(current_user)
    @user_daily_questionnaires = UserDailyQuestionnaire.where(user_datum_id: @currentUserData.ids.first)
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
    @currentUserData = UserDatum.user_user_data(current_user)
    @user_daily_questionnaire = UserDailyQuestionnaire.new(user_daily_questionnaire_params)
    # Pair the new daily questionnaire created by user with current user
    @user_daily_questionnaire.user_data=@currentUserData
    @user_daily_questionnaire.user_datum_id=@currentUserData.ids.first

    respond_to do |format|
      if @user_daily_questionnaire.save
        format.html { redirect_to @user_daily_questionnaire, notice: "User daily questionnaire was successfully created." }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_daily_questionnaire
      @user_daily_questionnaire = UserDailyQuestionnaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_daily_questionnaire_params
      params.require(:user_daily_questionnaire).permit(:questionnaireDate)
    end
end
