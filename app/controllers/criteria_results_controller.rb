class CriteriaResultsController < ApplicationController
  before_action :set_criteria_result, only: [:show, :edit, :update, :destroy]
  authorize_resource
  # GET /criteria_results
  def index
    @criteria_results = CriteriaResult.all
  end

  # GET /criteria_results/1
  def show
  end

  # GET /criteria_results/new
  def new
    @criteria_result = CriteriaResult.new
    @osces = Criterium.all
    #    @osces = Criterium.where(:station_id=>params[:id])
    #    @stations = Station.where(:station_name=>params[:station_name])
    #    @exam_show = Exam.where(:exam_code=>params[:id])
    @students = Student.where(:id=>params[:id])

  end

  # GET /criteria_results/1/edit
  def edit
  end

  # POST /criteria_results
  def create
    @criteria_result = CriteriaResult.new(criteria_result_params)

    if @criteria_result.save
      redirect_to @criteria_result, notice: 'Criteria result was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /criteria_results/1
  def update
    if @criteria_result.update(criteria_result_params)
      redirect_to @criteria_result, notice: 'Criteria result was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /criteria_results/1
  def destroy
    @criteria_result.destroy
    redirect_to criteria_results_url, notice: 'Criteria result was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criteria_result
      @criteria_result = CriteriaResult.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def criteria_result_params
      params.require(:criteria_result).permit(:criteria_mark, :answer, :feedback, :station_id)
    end
end
