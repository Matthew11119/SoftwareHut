class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  def index
    @students = Student.all
    @remaining_students = Student.left_joins(:station_results).where(station_results: { id: nil })
    @examined_students = Student.joins(:station_results)
  end

  def show_remaining
    @remaining_students = Student.left_joins(:station_results).where(station_results: { id: nil })
  end

  def show_examined
    @examined_students = Student.joins(:station_results)
  end

  def search
    @students = Student.where(student_id: params[:search][:student_id]).or(Student.where(surname: params[:search][:surname]))
    render :index
  end

  # GET /students/1
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:student_id, :forename, :surname, :regno)
    end
end
