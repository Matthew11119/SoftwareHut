class StationResultsController < ApplicationController
  before_action :set_station_result, only: [:show, :edit, :update, :destroy]

  # GET /station_results
  def index
    @station_results = StationResult.all
  end

  # GET /station_results/1
  def show
  end

  # GET /station_results/new
  def new
    @station_result = StationResult.new
    @exam_show = Exam.where(:exam_code=>params[:exam_id])    
    @stations = Station.all.where(:id=>params[:station_id])
  end

  # GET /station_results/1/edit
  def edit
  end

  # POST /station_results
  def create
    # @station_result = StationResult.new(station_result_params) # Create with the examiner name
    if params[:form_homepage][:examiner_name].present?
      new
      render :student_chooser_page
    end

    # if @station_result.save
    #   redirect_to @station_result, notice: 'Station result was successfully created.'
    # else
    #   render :new
    # end
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

  # GET /exams/:exam_id/stations/:station_id/station_results/:station_result_id/examiner_detail
  def examiner_detail
    set_module_lead_basic
  end
  
  # POST /exams/:exam_id/stations/:station_id/station_results/:station_result_id/remaining_students
  def remaining_students
    set_module_lead_basic
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station_result
      @station_result = StationResult.find(params[:id])
    end

    def set_module_lead_basic
      @station_result = StationResult.new
      @exam_show = Exam.where(:exam_code=>params[:exam_id])    
      @stations = Station.all.where(:id=>params[:station_id])  
    end

    # Only allow a trusted parameter "white list" through.
    # def station_result_params
    #   params.require(:station_result).permit(:result_id, :station_id, :student_id, :examiner_name, :mark, :feedback, :audio)
    # end
end
