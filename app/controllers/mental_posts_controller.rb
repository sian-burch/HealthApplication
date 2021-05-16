class MentalPostsController < ApplicationController
  before_action :set_mental_post, only: %i[ show edit update destroy ]

  # GET /mental_posts or /mental_posts.json
  def index
    @mental_posts = MentalPost.all
  end

  # GET /mental_posts/1 or /mental_posts/1.json
  def show
  end

  # GET /mental_posts/new
  def new
    @mental_post = MentalPost.new
  end

  # GET /mental_posts/1/edit
  def edit
  end

  # POST /mental_posts or /mental_posts.json
  def create
    @mental_post = MentalPost.new(mental_post_params)
    @mental_post.user = current_user

    respond_to do |format|
      if @mental_post.save
        format.html { redirect_to @mental_post, notice: "Mental post was successfully created." }
        format.json { render :show, status: :created, location: @mental_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mental_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mental_posts/1 or /mental_posts/1.json
  def update
    respond_to do |format|
      if @mental_post.update(mental_post_params)
        format.html { redirect_to @mental_post, notice: "Mental post was successfully updated." }
        format.json { render :show, status: :ok, location: @mental_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mental_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mental_posts/1 or /mental_posts/1.json
  def destroy
    @mental_post.destroy
    respond_to do |format|
      format.html { redirect_to mental_posts_url, notice: "Mental post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mental_post
      @mental_post = MentalPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mental_post_params
      params.require(:mental_post).permit(:title, :description, :user_id)
    end
end
