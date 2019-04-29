class StationResultsController < ApplicationController
  before_action :set_station_result, only: [:index, :edit, :update, :destroy]
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
      @exams_students = ExamsStudent.select_students(Station.find(params[:id]).exam_id)
      @exams_students.each do |exam_student|
        Student.from_ldap(exam_student.student_id)
      end

      if (defined?params[:form_homepage][:examiner_name])
        @examiner_name = params[:form_homepage][:examiner_name]
        @exams_students.each do |exam_student|
          cur_stu = StationResult.find_or_initialize_by(username: exam_student.student_id, station_id: params[:id])
          cur_stu.save
        end
        # StationResult.write_students(@examiner_name, params[:id], Station.find(params[:id]).exam_id)
      end
      @students = StationResult.get_remaining_student(params[:id])
    end

  end

  # GET /station_results/1/completed_students
  def completed_students
    set_instance_variable
    @students = StationResult.get_completed_student(params[:id],params[:examiner_name])
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
    #set_instance_variable
    @student = Student.where(username: params[:username]).first
    @exam_show = Exam.where(:exam_code=>Station.find(params[:station_id]).exam_id)
    @station = Station.where(:id=>params[:station_id]).first
    @answers = Answer.where(:station_id=>params[:station_id])
    @station_result = StationResult.new
    @station_result.criteria_results.build
    @display_student = @student.forename + " " + @student.surname + "              " + @student.regno.to_s
    @osces = Criterium.where(station_id:params[:station_id])
    @station_result_id = StationResult.all.count + 1
    @examiner_name = params[:examiner_name]
  end

  # GET /station_results/1/edit
  def edit
    @station_result = StationResult.find(params[:id])
  end

  # GET/station_results/1/search_students
  def search_students
    @students = Student.joins("INNER JOIN station_results ON station_results.username = students.username").where("students.username= '"+params[:form_search][:student_id]+"'").limit(1)
    render 'search_students'
  end

  # GET /results/EX0099/s1
  def student_result
    @student = Student.find(params[:username])
    @exam = Exam.find(params[:exam_code])
    @station_results = StationResult.where( username: @student.username, station_id: @exam.stations.pluck(:id) )
    render :index
  end

  # POST /station_results
  def create
    @station_result = StationResult.new(post_params)
    @osces = Criterium.all
    @criteria_result = @station_result.criteria_results
    @station = Station.where(:id => params[:station_id]).first
    @criteria_result.each do |i|
      updated_criteria = calculate_crit_mark(i)
      i.write_attribute(:answer, updated_criteria.answer)
      i.write_attribute(:criteria_mark, updated_criteria.criteria_mark)
    end
    calculate_mark
    audio_ref = "Downloads/examiner_name=" + @examiner_name.to_s + "&station_id=" + @station_result.station_id.to_s + "&username=" + @station_result.username.to_s
    @station_result.write_attribute(:audio, audio_ref)
    @student = Student.where(:username=>params[:student_id]).first
    if @station_result.save
      redirect_to station_result_path(@station_result.station_id), notice: 'Station result was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /station_results/1
  def update
    @station_result = StationResult.find(params[:id])
    if @station_result.update(station_result_params)
      redirect_to edit_station_result_url(@station_result.id), notice: 'Station result was successfully updated.'
      #redirect_to student_result_url(exam_code: @station_result.station.exam.exam_code, username: @station_result.username), notice: 'Station result was successfully updated.'
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
      params.require(:station_result).permit([:id, :station_id, :student_id, :examiner_name, :mark, :feedback, :audio, :username,
        :criteria_results_attributes => [:id, :criteria_mark, :answer, :station_result_id, :criterium_id, :feedback, :station_id]])
    end

    def post_params
      params.require(:station_result).permit(:id, :station_id, :username, :examiner_name, :mark, :feedback, :audio,
        :criteria_results_attributes=> [:id, :answer, :criteria_mark, :station_result_id, :feedback, :criterium_id])
    end

    def criteria_params
      params.require(:criteria_results).permit(:id, :answer, :criteria_mark, :station_id)
    end

    def calculate_crit_mark(crit)
      if crit.answer_before_type_cast == nil
        if crit.criteria_mark == 1
          crit.criteria_mark = -1000
        else
          crit.criteria_mark = 0
        end
      else
        newAnswer = Answer.select("score","id").where("text = ?", crit.answer_before_type_cast).first
        crit.answer = newAnswer.id
        if crit.criteria_mark == 1
          if newAnswer.score = 0
            crit.criteria_mark = -1000
          else
            crit.criteria_mark = newAnswer.score
          end
        else
          crit.criteria_mark = newAnswer.score
        end
      end
      return crit
    end

    def calculate_mark
      if @station_result.mark.to_i == 2
        @station_result.write_attribute(:mark, @station.pass_mark)
      elsif @station_result.mark.to_i == 0
        @station_result.write_attribute(:mark, 0)
      else
        subtotal = 0
        @criteria_result.each do |i|
          puts i.criteria_mark
          subtotal += i.criteria_mark
        end
        @station_result.write_attribute(:mark, subtotal)
      end
    end
end
