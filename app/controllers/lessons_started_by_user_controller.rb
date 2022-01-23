class LessonsStartedByUserController < ApplicationController
  before_action :set_lesson_started_by_user, only: %i[ show edit update destroy ]

  # GET /lessons_started_by_user or /lessons_started_by_user.json
  def index
    @lessons_started_by_user = LessonStartedByUser.all
  end

  # GET /lessons_started_by_user/1 or /lessons_started_by_user/1.json
  def show
  end

  # GET /lessons_started_by_user/new
  def new
    @lesson_started_by_user = LessonStartedByUser.new
  end

  # GET /lessons_started_by_user/1/edit
  def edit
  end

  # POST /lessons_started_by_user or /lessons_started_by_user.json
  def create
    @lesson_started_by_user = LessonStartedByUser.new(lesson_started_by_user_params)

    respond_to do |format|
      if @lesson_started_by_user.save
        format.html { redirect_to lesson_started_by_user_url(@lesson_started_by_user), notice: "Lesson started by user was successfully created." }
        format.json { render :show, status: :created, location: @lesson_started_by_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_started_by_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons_started_by_user/1 or /lessons_started_by_user/1.json
  def update
    respond_to do |format|
      if @lesson_started_by_user.update(lesson_started_by_user_params)
        format.html { redirect_to lesson_started_by_user_url(@lesson_started_by_user), notice: "Lesson started by user was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_started_by_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_started_by_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons_started_by_user/1 or /lessons_started_by_user/1.json
  def destroy
    @lesson_started_by_user.destroy

    respond_to do |format|
      format.html { redirect_to lessons_started_by_user_url, notice: "Lesson started by user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_started_by_user
      @lesson_started_by_user = LessonStartedByUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_started_by_user_params
      params.require(:lesson_started_by_user).permit(:user_id, :lesson_id, :completed)
    end
end
