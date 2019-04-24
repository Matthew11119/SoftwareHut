class StationResultsController < ApplicationController
  before_action :set_station_result, only: [:show, :edit, :update, :destroy]
  authorize_resource
  # GET /station_results
  def index
    @station_results = StationResult.all
  end

  # GET /station_results/1
  def show
    @station_result = StationResult.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Hello World"
        send_data pdf.render, filename: "{@station_result.student_id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /station_results/new
  def new
    @station_result = StationResult.new
    @station_result.criteria_results.build
    @exam_show = Exam.where(exam_code: 'EX001').take
    @station = Station.where(id: 1).take
    @student = Student.take
    @display_student = @student.forename + " " + @student.surname + "              " + @student.regno.to_s
    @osces = Criterium.where(station_id:1)
    @station_result_id = StationResult.all.count + 1
    puts "Station result id is " + @station_result_id.to_s
    #    @osces = Criterium.where(:station_id=>params[:id])
    #    @stations = Station.where(:station_name=>params[:station_name])
    #    @exam_show = Exam.where(:exam_code=>params[:id])
    #@students = Student.where(:id=>params[:id])
  end

  # GET /station_results/1/edit
  def edit
  end

  # POST /station_results
  def create
    @station_result = StationResult.new(post_params)
    @osces = Criterium.all
    @criteria_result = @station_result.criteria_results
    @criteria_result.each do |i|
      updated_criteria = calculate_crit_mark(i)
      i.write_attribute(:answer, updated_criteria.answer)
      i.write_attribute(:criteria_mark, updated_criteria.criteria_mark)
    end
    calculate_mark
    @exam_show = Exam.where(exam_code: 'EX001').take
    @station = Station.where(id: 1).take
    @student = Student.take
    @display_student = @student.forename + " " + @student.surname + "              " + @student.regno.to_s
    @osces = Criterium.where(station_id:1)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station_result
      @station_result = StationResult.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def station_result_params
      params.require(:station_result).permit([:result_id, :station_id, :student_id, :examiner_name, :mark, :feedback, :audio,
        :criteria_results => [:id, :answer, :criteria_mark, :station_result_id, :feedback]])
    end

    def post_params
      params.require(:station_result).permit([:station_id, :student_id, :examiner_name, :mark, :feedback, :audio,
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
      subtotal = 0
      @criteria_result.each do |i|
        subtotal += i.criteria_mark
      end
      @station_result.write_attribute(:mark, subtotal)
    end

end
