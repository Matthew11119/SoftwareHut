class CriteriaController < ApplicationController
  before_action :set_criterium, only: [:show, :edit, :update, :destroy]
  authorize_resource
  # GET /criteria
  def index
    @criteria = Criterium.all
  end

  # GET /criteria/1
  def show
  end

  # GET /criteria/new
  def new
    @criterium = Criterium.new
  end

  # GET /criteria/1/edit
  def edit
    @criterium = Criterium.new
  end

  # POST /criteria
  def create
    @criterium = Criterium.new
    puts "Params are " + params.to_s
    @criterium[:number] = 0
    @criterium[:criteria_description] = ''
    @criterium[:criteria_critical] = false
    @criterium[:station_id] = params[:id]


    if @criterium.save
      redirect_to edit_station_path(@criterium.station), notice: 'Criterium was successfully created.'
    else
      redirect_to new_criterium_path(@criterium.number)
    end
  end

  # PATCH/PUT /criteria/1
  def update
    if @criterium.update(criterium_params)
      redirect_to @criterium, notice: 'Criterium was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /criteria/1
  def destroy
    station_id = @criterium.station_id
    @criterium.destroy
    redirect_to edit_station_path(station_id), notice: 'Criterium was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criterium
      @criterium = Criterium.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def criterium_params
      params.require(:criterium).permit(:criteria_id, :criteria_description, :criteria_critical, :station_id)
    end
end
