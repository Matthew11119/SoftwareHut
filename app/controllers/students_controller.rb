class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  authorize_resource
  # GET /students
  def index
    @students = Student.all
    @modules = UniModule.all
    respond_to do |format|
      format.csv { send_data  @students.to_csv }
    end
  end


  # GET /students/new
  def new
    @student = Student.new
    render layout: false
  end

  # POST /students
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    @student = Student.find params[:id]
    if @student.update(student_params)
      redirect_to edit_student_path(@student.id), notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to exam_edit_path, notice: 'Student was successfully deleted.'
  end

  def destroy_multiple
    Student.delete(params[:student_users])
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Students were successfully deleted' }
      format.json { head :no_content }
    end
  end

  def student_import
    Student.student_import(params[:file])
    redirect_to students_path, notice: "Students added successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:username, :forename, :surname, :regno)
    end
end
