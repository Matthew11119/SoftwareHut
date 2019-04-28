class StationResultsController < ApplicationController
  before_action :set_station_result, only: [:edit, :update, :destroy]
  authorize_resource
  # GET /station_results
  def index
    @station_results = StationResult.all
  end

  # GET /station_results/1
  def show
    # @station_result = StationResult.find(params[:id])
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     pdf = Prawn::Document.new
    #     pdf.text "Hello World"
    #     send_data pdf.render, filename: "{@station_result.student_id}.pdf",
    #                           type: "application/pdf",
    #                           disposition: "inline"
    #   end
    # end
    
    if can?(:manage, Exam)
      @station_result = StationResult.find(params[:id])
    elsif can?(:edit, CriteriaResult) 
      set_instance_variable                  
      if (defined?params[:form_homepage][:examiner_name])        
        @examiner_name = params[:form_homepage][:examiner_name]
        StationResult.write_students(@examiner_name, params[:id], Station.find(params[:id]).exam_id)
      end      
      @students = StationResult.get_remaining_student(params[:id])
    end
    
  end

  # GET /station_results/1/completed_students
  def completed_students
    set_instance_variable
  end

  # GET /station_results/1/add_student
  def add_student
    @examiner_name = params[:examiner_name]
    render layout:false
    
  end

  # POST /station_results/1/search_new_student
  def search_new_student
    @new_student = User.new(username: params[:new_student_form][:username])
    @new_student.get_info_from_ldap
    @examiner_name = params[:new_student_form][:examiner_name]
    if !(@new_student.sn.nil?)
      render 'search_new_student'
    else 
      render 'search_no_student'
    end
  end

  # POST /station_results/1
  def new_student
    Student.find_or_create_by(forename:params[:hid_stu_info][:forename], username:params[:hid_stu_info][:username],surname:params[:hid_stu_info][:surname])
    # ExamsStudent.find_or_create_by(student_id:params[:hid_stu_infp][:username], exam_id:'EX0001')
    ExamsStudent.find_or_create_by(exam_id: Station.find(params[:id]).exam_id, student_id: params[:hid_stu_info][:username])
    @examiner_name = params["hid_stu_info"][:examiner_name]    
    StationResult.write_students(@examiner_name, params[:id], Station.find(params[:id]).exam_id)    
    @students = StationResult.get_remaining_student(params[:id])
    render 'new_student_success'    
  end

  # GET /station_results/new
  def new
    @station_result = StationResult.new
    @station_result.criteria_results.build
  end

  # GET /station_results/1/edit
  def edit
  end

  # GET /exams/results/EX0099/students/1
  def student_result
    @student = Student.find(params[:username])
    @exam = Exam.find(params[:exam_code])
    @station_results = StationResult.where( username: @student.username, station_id: @exam.stations.collect(&:id) )
    render :index
  end

  # POST /station_results
  def create
    @station_result = StationResult.new(station_result_params)

    if @station_result.save
      redirect_to @station_result, notice: 'Station result was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /station_results/1
  def update
    if @station_result.update(station_result_params)
      redirect_to @station_result, notice: 'Station result was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /station_results/1
  def destroy
    @station_result.destroy
    redirect_to station_results_url, notice: 'Station result was successfully destroyed.'
  end

  # GET /station_results/1/ready_screen
  def ready_screen
    @exam_show = Exam.where(:exam_code=>Station.find(params[:id]).exam_id)
    @stations = Station.where(:id=>params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station_result
      @station_result = StationResult.find(params[:id])
    end

    # For EXAMINER, variables for view
    def set_instance_variable
      @exam_show = Exam.where(:exam_code=>Station.find(params[:id]).exam_id)
      @stations = Station.where(:id=>params[:id])  
      @examiner_name = ''
    end

    def get_examiner
      @examiner_name
    end

    def set_examiner_name(name)
      @examiner_name = name
    end

    # Only allow a trusted parameter "white list" through.
    def station_result_params
      params.require(:station_result).permit(:id, :station_id, :student_id, :examiner_name, :mark, :feedback, :audio,
        :criteria_result_attributes => [:id, :criteria_mark, :answer, :station_result_id])
    end
end
