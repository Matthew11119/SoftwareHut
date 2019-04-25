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
    set_instance_variable
  end

  # GET /station_results/1/completed_students
  def completed_students
    set_instance_variable
  end

  # GET /station_results/1/add_student
  def add_student
    set_instance_variable
  end

  # GET /station_results/new
  def new
    @station_result = StationResult.new
  end

  # GET /station_results/1/edit
  def edit
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

    # For EXAMINER
    def set_instance_variable
      @exam_show = Exam.where(:exam_code=>Station.find(params[:id]).exam_id)
      @stations = Station.where(:id=>params[:id])   
    end

    # Only allow a trusted parameter "white list" through.
    def station_result_params
      params.require(:station_result).permit(:id, :station_id, :student_id, :examiner_name, :mark, :feedback, :audio)
    end
end
