class LessonDoubtCommentsController < ApplicationController
  before_action :set_lesson_doubt_comment, only: %i[ show edit update destroy ]

  # GET /lesson_doubt_comments or /lesson_doubt_comments.json
  def index
    @lesson_doubt_comments = LessonDoubtComment.all
  end

  # GET /lesson_doubt_comments/1 or /lesson_doubt_comments/1.json
  def show
  end

  # GET /lesson_doubt_comments/new
  def new
    @lesson_doubt_comment = LessonDoubtComment.new
  end

  # GET /lesson_doubt_comments/1/edit
  def edit
  end

  # POST /lesson_doubt_comments or /lesson_doubt_comments.json
  def create
    @lesson_doubt_comment = LessonDoubtComment.new(lesson_doubt_comment_params)

    respond_to do |format|
      if @lesson_doubt_comment.save
        format.html { redirect_to lesson_doubt_comment_url(@lesson_doubt_comment), notice: "Lesson doubt comment was successfully created." }
        format.json { render :show, status: :created, location: @lesson_doubt_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_doubt_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_doubt_comments/1 or /lesson_doubt_comments/1.json
  def update
    respond_to do |format|
      if @lesson_doubt_comment.update(lesson_doubt_comment_params)
        format.html { redirect_to lesson_doubt_comment_url(@lesson_doubt_comment), notice: "Lesson doubt comment was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_doubt_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_doubt_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_doubt_comments/1 or /lesson_doubt_comments/1.json
  def destroy
    @lesson_doubt_comment.destroy

    respond_to do |format|
      format.html { redirect_to lesson_doubt_comments_url, notice: "Lesson doubt comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_doubt_comment
      @lesson_doubt_comment = LessonDoubtComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_doubt_comment_params
      params.require(:lesson_doubt_comment).permit(:doubt_id, :user_id, :doubt_text, :answered)
    end
end
