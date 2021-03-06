#Answers Controller controls interactions between the Model and Views for Answers

class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  authorize_resource
  # GET /answers
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  def create
    @answer = Answer.new
    
    #creates blank answer for user to edit in edit view
    @answer[:text]       = ''
    @answer[:score]      = 0
    @answer[:station_id] = params[:id]

    if @answer.save
      redirect_to edit_station_path(@answer.station), notice: 'Answer was successfully created.'
    else
      redirect_to edit_station_path(@answer.station), notice: 'Error creating new Answer.'
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /answers/1
  def destroy
    station_id = @answer.station_id
    @answer.destroy
    redirect_to edit_station_path(station_id), notice: 'Answer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:text, :score, :station_id)
    end
end
