class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]
  before_action :create_station_result_detail 
  # GET /stations
  def index 
    @stations = Station.all
  end

  # GET /stations/1
  def show
    # @station = Station.paginate(:page => params[:station], :per_page => 10)
    @station_show = @station.paginate(:page => params[:station], :per_page => 10)
    @exam_show = Exam.where(:exam_code=>params[:id])
  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  def create
    @station = Station.new(station_params)

    if @station.save
      redirect_to @station, notice: 'Station was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stations/1
  def update
    if @station.update(station_params)
      redirect_to @station, notice: 'Station was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stations/1
  def destroy
    @station.destroy
    redirect_to stations_url, notice: 'Station was successfully destroyed.'
  end

  # /stations/id/detail
  def detail
    @exam_show = Exam.where(:exam_code=>params[:id])
    @stations = Station.all.where(:station_name=>params[:station_name])
    # @index = 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      # @station = Station.find(params[:id])
      @station = Station.where(:exam_code=>params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def station_params
      params.require(:station).permit(:station_id, :station_name, :pass_mark, :exam_id)
    end

    def create_station_result_detail
      @station_result_detail = StationResult.new
    end

    def detail_params1
      params.require(:station_result_detail).permit(:examiner_name)
    end
end
