class WeightDiariesController < ApplicationController
  before_action :set_weight_diary, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :show]
  before_action :correct_user,only: [:edit, :update, :destroy]

  # GET /weight_diaries or /weight_diaries.json
  def index
    @weight_diaries = WeightDiary.all
  end

  # GET /weight_diaries/1 or /weight_diaries/1.json
  def show
  end

  # GET /weight_diaries/new
  def new
    @weight_diary = current_user.weight_diaries.build
  end

  # GET /weight_diaries/1/edit
  def edit
  end

  # POST /weight_diaries or /weight_diaries.json
  def create
    @weight_diary = current_user.weight_diaries.build(weight_diary_params)

    respond_to do |format|
      if @weight_diary.save
        format.html { redirect_to @weight_diary, notice: "Weight diary was successfully created." }
        format.json { render :show, status: :created, location: @weight_diary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weight_diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weight_diaries/1 or /weight_diaries/1.json
  def update
    respond_to do |format|
      if @weight_diary.update(weight_diary_params)
        format.html { redirect_to @weight_diary, notice: "Weight diary was successfully updated." }
        format.json { render :show, status: :ok, location: @weight_diary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weight_diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weight_diaries/1 or /weight_diaries/1.json
  def destroy
    @weight_diary.destroy
    respond_to do |format|
      format.html { redirect_to weight_diaries_url, notice: "Weight diary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @weight_diary = current_user.weight_diaries.find_by(id: params[:id])
    redirect_to weight_diaries_path, notice: "Not Authorised To Edit Weight" if @weight_diary.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight_diary
      @weight_diary = WeightDiary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weight_diary_params
      params.require(:weight_diary).permit(:weight, :date, :user_id)
    end
end
