class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  def create
    @station = Station.new

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
    if @station.update(station_params)
      redirect_to edit_station_path(@station.id), notice: 'Station was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stations/1
  def destroy
    @station.destroy
    redirect_to stations_url, notice: 'Station was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def station_params
      params.require(:station).permit([:id, :station_name, :pass_mark, :exam_id,
        :criteria_attributes => [:id, :number, :criteria_description, :criteria_critical, :station_id],
        :answers_attributes  => [:id, :text, :score, :station_id]])
    end
end
