class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]
  layout :resolve_layout
  # GET /lessons or /lessons.json
  def index
    @q = Lesson.ransack(params[:q])
    @lessons = @q.result(distinct: true)
    @lessons =  @lessons.order(category: :asc, number_order: :asc).page(params[:page]).per(1)
  end

  # GET /lessons/1 or /lessons/1.json
  def show
    @lesson_previous = Lesson.find_by(number_order: @lesson.number_order - 1)
    @lesson_next = Lesson.find_by(number_order: @lesson.number_order + 1)
    @lesson.update_attribute(:views, @lesson.views.to_i + 1)
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_url, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:name, :content)
    end

    def resolve_layout
      'other_pages_layout'
  end
end
