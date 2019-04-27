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
      end
    end

  end

  # GET /station_results/1/completed_students
  def completed_students
    set_instance_variable
  end

  # GET /station_results/1/add_student
  def add_student
    render layout:false
  end

  # POST /station_results/1/search_new_student
  def search_new_student
    @new_student = User.new(username: params[:new_student_form][:username])
    @new_student.get_info_from_ldap
    if !(@new_student.sn.nil?)
      render 'search_new_student'
    else
      render 'search_no_student'
    end
  end

  # POST /station_results/1
  def new_student
    render 'new_student_success'
  end

  # GET /station_results/new
  def new
    #set_instance_variable
    puts params[:format]
    puts params.inspect
    puts @stations.inspect
    @student = Student.where(username: params[:username]).first
    puts @student.inspect
    @exam_show = Exam.where(:exam_code=>Station.find(params[:station_id]).exam_id)
    @station = Station.where(:id=>params[:station_id]).first
    @station_result = StationResult.new
    @station_result.criteria_results.build
    @display_student = @student.forename + " " + @student.surname + "              " + @student.regno.to_s
    @osces = Criterium.where(station_id:params[:station_id])
    @station_result_id = StationResult.all.count + 1
  end

  # GET /station_results/1/edit
  def edit
  end

  # GET /exams/results/EX0099/students/1
  def student_result
    @student = Student.find(params[:regno])
    @exam = Exam.find(params[:exam_code])

  end

  # POST /station_results
  def create
    puts "THIS SHOULD CREATE"
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
    @student = Student.where(:username=>params[:student_id]).first
    puts @station_result.student_id
    if @station_result.save
      puts "REDIRECT"
      redirect_to completed_students_station_result_path(@station_result.station_id), notice: 'Station result was successfully created.'
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

    # For EXAMINER
    def set_instance_variable
      @exam_show = Exam.where(:exam_code=>Station.find(params[:id]).exam_id)
      @stations = Station.where(:id=>params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def station_result_params
      params.require(:station_result).permit(:id, :station_id, :student_id, :examiner_name, :mark, :feedback, :audio,
        :criteria_result_attributes => [:id, :criteria_feedback_id, :criteria_mark, :answer, :station_id])
    end

    def post_params
      params.require(:station_result).permit([:id, :station_id, :student_id, :examiner_name, :mark, :feedback, :audio,
        {criteria_results_attributes: [:id, :answer, :criteria_mark, :station_result_id, :feedback]}])
    end

    def criteria_params
      params.require(:criteria_results).permit(:id, :answer, :criteria_mark, :station_id)
    end

    def calculate_crit_mark(crit)

      puts crit.inspect
      if crit.criteria_mark == 1
        if crit.answer_before_type_cast == "Not Met"
          crit.criteria_mark = -1000
        else
          crit.criteria_mark = 2
        end
      else
        newAnswer = Answer.select("score").where("text = ?", crit.answer_before_type_cast).first
        puts newAnswer.inspect
        puts crit.answer_before_type_cast
        crit.criteria_mark = newAnswer.score
        if crit.answer_before_type_cast == "Fully met"
          crit.answer = 0
        elsif crit.answer_before_type_cast == "Partially met"
          crit.answer = 1
        else
          crit.answer = 2
        end
      end
      return crit
    end

    def calculate_mark
      if @station_result.mark == 2
        @station_result.write_attribute(:mark, @station.pass_mark)
      elsif @station_result.mark = 0
        @station_result.write_attribute(:mark, 0)
      else
        subtotal = 0
        @criteria_result.each do |i|
          subtotal += i.criteria_mark
        end
        @station_result.write_attribute(:mark, subtotal)
      end
    end
end
