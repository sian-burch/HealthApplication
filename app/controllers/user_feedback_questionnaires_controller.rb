class UserFeedbackQuestionnairesController < ApplicationController
  before_action :set_user_feedback_questionnaire, only: %i[ show edit update destroy ]

  # GET /user_feedback_questionnaires or /user_feedback_questionnaires.json
  def index
    @currentUserData = UserDatum.user_user_data(current_user)
    @user_feedback_questionnaires = UserFeedbackQuestionnaire.where(user_datum_id: @currentUserData.ids.first)
    # @user_feedback_questionnaires = UserFeedbackQuestionnaire.where(user_datum_id: @currentUserData.ids.first)
  end

  # GET /user_feedback_questionnaires/1 or /user_feedback_questionnaires/1.json
  def show
    @belongToUser = @user_feedback_questionnaire.user_datum_id
  end

  # GET /user_feedback_questionnaires/new
  def new
    @user_feedback_questionnaire = UserFeedbackQuestionnaire.new
  end

  # GET /user_feedback_questionnaires/1/edit
  def edit
  end

  # POST /user_feedback_questionnaires or /user_feedback_questionnaires.json
  def create
    @currentUserData = UserDatum.user_user_data(current_user)
    @user_feedback_questionnaire = UserFeedbackQuestionnaire.new(user_feedback_questionnaire_params)
    # Pair the new feedback questionnaire created by user with current user
    @user_feedback_questionnaire.user_data=@currentUserData
    @user_feedback_questionnaire.user_datum_id=@currentUserData.ids.first
    
    respond_to do |format|
      if @user_feedback_questionnaire.save
        format.html { redirect_to @user_feedback_questionnaire, notice: "User feedback questionnaire was successfully created." }
        format.json { render :show, status: :created, location: @user_feedback_questionnaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_feedback_questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_feedback_questionnaires/1 or /user_feedback_questionnaires/1.json
  def update
    respond_to do |format|
      if @user_feedback_questionnaire.update(user_feedback_questionnaire_params)
        format.html { redirect_to @user_feedback_questionnaire, notice: "User feedback questionnaire was successfully updated." }
        format.json { render :show, status: :ok, location: @user_feedback_questionnaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_feedback_questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_feedback_questionnaires/1 or /user_feedback_questionnaires/1.json
  def destroy
    @user_feedback_questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to user_feedback_questionnaires_url, notice: "User feedback questionnaire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_feedback_questionnaire
      @user_feedback_questionnaire = UserFeedbackQuestionnaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_feedback_questionnaire_params
      params.require(:user_feedback_questionnaire).permit(:questionnaireDate)
    end
end
