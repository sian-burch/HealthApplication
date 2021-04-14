class UserDataController < ApplicationController
  before_action :set_user_datum, only: %i[ show edit update destroy ]
  
  # GET /user_data or /user_data.json
  def index
    @user_data = UserDatum.all
    @user_data = UserDatum.user_user_data(current_user)
  end

  # GET /user_data/1 or /user_data/1.json
  def show
  end

  # GET /user_data/new
  def new
    @user_datum = UserDatum.new
  end

  # GET /user_data/1/edit
  def edit
  end

  # POST /user_data or /user_data.json
  def create
    @user_datum = UserDatum.new(user_datum_params)
    @user_datum.user=current_user

    respond_to do |format|
      if @user_datum.save
        format.html { redirect_to @user_datum, notice: "User datum was successfully created." }
        format.json { render :show, status: :created, location: @user_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_data/1 or /user_data/1.json
  def update
    respond_to do |format|
      if @user_datum.update(user_datum_params)
        format.html { redirect_to @user_datum, notice: "User datum was successfully updated." }
        format.json { render :show, status: :ok, location: @user_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_data/1 or /user_data/1.json
  def destroy
    @user_datum.destroy
    respond_to do |format|
      format.html { redirect_to user_data_url, notice: "User datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_datum
      @user_datum = UserDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_datum_params
      params.require(:user_datum).permit(:height, :weight, :age, :gender, :athletic_lvl, :physical, :mental, :indoor, :outdoor, :meditation, :running, :walking, :frequency_pref, :duration_pref, :BMI)
    end

  
end
