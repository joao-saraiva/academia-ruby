class LessonDoubtsController < ApplicationController
  before_action :set_lesson_doubt, only: %i[ show edit update destroy ]

  # GET /lesson_doubts or /lesson_doubts.json
  def index
    @lesson_doubts = LessonDoubt.all
  end

  # GET /lesson_doubts/1 or /lesson_doubts/1.json
  def show
    @comment = LessonDoubtComment.new(doubt_id: @lesson_doubt.id)
  end

  # GET /lesson_doubts/new
  def new
    @lesson_doubt = LessonDoubt.new(lesson_id: params[:lesson_id])
  end

  # GET /lesson_doubts/1/edit
  def edit
  end

  # POST /lesson_doubts or /lesson_doubts.json
  def create
    @lesson_doubt = LessonDoubt.new(lesson_doubt_params)

    respond_to do |format|
      if @lesson_doubt.save
        format.html { redirect_to lesson_doubt_url(@lesson_doubt), notice: "Lesson doubt was successfully created." }
        format.json { render :show, status: :created, location: @lesson_doubt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_doubt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_doubts/1 or /lesson_doubts/1.json
  def update
    respond_to do |format|
      if @lesson_doubt.update(lesson_doubt_params)
        format.html { redirect_to lesson_doubt_url(@lesson_doubt), notice: "Lesson doubt was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_doubt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_doubt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_doubts/1 or /lesson_doubts/1.json
  def destroy
    @lesson_doubt.destroy

    respond_to do |format|
      format.html { redirect_to lesson_doubts_url, notice: "Lesson doubt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def post_comment
    comment = LessonDoubtComment.new(lesson_doubt_comment_params)
    @lesson_doubt = comment.doubt
    if comment.save
      redirect_to lesson_doubt_url(@lesson_doubt), notice: "Comment was successfully posted."
    else
      @comment = comment
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_doubt
      @lesson_doubt = LessonDoubt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_doubt_params
      params.require(:lesson_doubt).permit(:lesson_id, :name, :description)
    end

    def lesson_doubt_comment_params
      params.require(:lesson_doubt_comment).permit(:doubt_id, :user_id, :doubt_text, :answered)
    end
end
