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
    @osces = Criterium.all
    #    @osces = Criterium.where(:station_id=>params[:id])
    #    @stations = Station.where(:station_name=>params[:station_name])
    #    @exam_show = Exam.where(:exam_code=>params[:id])
    @students = Student.where(:id=>params[:id])
  end

  # GET /station_results/1/edit
  def edit
  end

  # POST /station_results
  def create
    @station_result = StationResult.new(post_params)
    @osces = Criterium.all
    @criteria_result = @station_result.criteria_results
    puts @station_result.station_id

    #@criteria_result = CriteriaRestult.new(criteria_params)
    puts "TEST"
    if @station_result.save
      puts "WORKED"
      redirect_to @station_result, notice: 'Station result was successfully created.'
    else
      puts "DIDN'T WORK"
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
        :criteria_results => [:id, :answer, :criteria_mark, :station_id]])
    end

    def post_params
      params.require(:station_result).permit([:result_id, :station_id, :student_id, :examiner_name, :mark, :feedback, :audio,
        {criteria_results_attributes: [:id, :answer, :criteria_mark, :station_id]}])
      #params.permit(:result_id, :station_id, :student_id, :examiner_name, :mark, :feedback, :audio)
      #params.permit(criteria_results: [:id, :answer, :criteria_mark, :station_id])
    end

    def criteria_params
      params.require(:criteria_results).permit(:id, :answer, :criteria_mark, :station_id)
    end
end
