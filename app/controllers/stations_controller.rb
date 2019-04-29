#Stations Controller controls interactions between the Model and Views for Stations

class StationsController < ApplicationController  
  authorize_resource
  
  # GET /stations
  def index 
    @stations = Station.all
  end

  # GET /stations/1
  def show    
    @station_show = @station.paginate(:page => params[:station], :per_page => 10)
    @exam_show = Exam.where(:exam_code=>params[:id])
  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
    @station = Station.find(params[:id])
    render :edit
  end

  # POST /stations
  def create
    @station = Station.new

    #created blank, user fills in values in edit view
    @station.station_name = "New Station"
    @station.pass_mark = 0
    @station.exam_id = params[:id]

    if @station.save
      redirect_to edit_station_path(@station.id), notice: 'Station was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stations/1
  def update
    @station = Station.find params[:id]
    if @station.update(station_params)
      redirect_to edit_station_path(@station.id), notice: 'Station was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stations/1
  def destroy
    @station = Station.find params[:id]
    exam_id = @station.exam_id
    @station.destroy
    redirect_to edit_exam_path(exam_id), notice: 'Station was successfully destroyed.'
  end

  # /stations/id/detail
  def detail
    @exam_show = Exam.where(:exam_code=>params[:id])
    @stations = Station.all.where(:station_name=>params[:station_name])
    # @index = 
  end

  # /stations/id/
  def detail_form
    @exam_show = Exam.where(:exam_code=>params[:station_result][:exam_code])
    @stations = Station.all.where(:station_name=>params[:station_result][:station_name])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      # @station = Station.find(params[:id])
      @station = Station.where(:exam_id=>params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def station_params
      params.require(:station).permit([:id, :station_name, :pass_mark, :exam_id,
        :criteria_attributes => [:id, :number, :criteria_description, :criteria_critical, :station_id],
        :answers_attributes  => [:id, :text, :score, :station_id]])
    end

    def create_station_result_detail
      @station_result_detail = StationResult.new
    end
 
end
