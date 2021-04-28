class RecommendedDailyStepsController < ApplicationController
  before_action :set_recommended_daily_step, only: %i[ show edit update destroy ]

  # GET /recommended_daily_steps or /recommended_daily_steps.json
  def index
    @recommended_daily_steps = RecommendedDailyStep.all
  end

  # GET /recommended_daily_steps/1 or /recommended_daily_steps/1.json
  def show
  end

  # GET /recommended_daily_steps/new
  def new
    @recommended_daily_step = RecommendedDailyStep.new
  end

  # GET /recommended_daily_steps/1/edit
  def edit
  end

  # POST /recommended_daily_steps or /recommended_daily_steps.json
  def create
    @recommended_daily_step = RecommendedDailyStep.new(recommended_daily_step_params)

    respond_to do |format|
      if @recommended_daily_step.save
        format.html { redirect_to @recommended_daily_step, notice: "Recommended daily step was successfully created." }
        format.json { render :show, status: :created, location: @recommended_daily_step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recommended_daily_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recommended_daily_steps/1 or /recommended_daily_steps/1.json
  def update
    respond_to do |format|
      if @recommended_daily_step.update(recommended_daily_step_params)
        format.html { redirect_to @recommended_daily_step, notice: "Recommended daily step was successfully updated." }
        format.json { render :show, status: :ok, location: @recommended_daily_step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recommended_daily_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommended_daily_steps/1 or /recommended_daily_steps/1.json
  def destroy
    @recommended_daily_step.destroy
    respond_to do |format|
      format.html { redirect_to recommended_daily_steps_url, notice: "Recommended daily step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommended_daily_step
      @recommended_daily_step = RecommendedDailyStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recommended_daily_step_params
      params.require(:recommended_daily_step).permit(:age, :minimum, :medium, :high)
    end
end
