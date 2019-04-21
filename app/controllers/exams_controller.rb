class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  authorize_resource
  # GET /exams
  def index
    if can?(:manage, Exam)
      @undeployed = Exam.undeployed
      @deployed = Exam.deployed
      @completed = Exam.completed
      render 'index'
    elsif can?(:edit, CriteriaResult)
      @exam_today = Exam.where("date = ?", [Time.now]).paginate(:page => params[:exam_today_page], :per_page => 5)
      @exam_upcoming = Exam.where("date > ?",[Time.now]).paginate(:page => params[:exam_upcoming_page], :per_page => 10)
      render 'index_module_lead'
    else
      @exams = Exam.completed
      render 'index_moderator'
    end
  end

  # GET /exams/1
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
    @exam.stations.build
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  def create
    @exam = Exam.new({:status => 0}.merge(exam_params))

    if @exam.save
      redirect_to edit_exam_path, notice: 'Exam was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /exams/1
  def update
    if @exam.update(exam_params)
      if params[:exam].has_key?(:status) && !params[:exam].has_key?(:name)
        redirect_to exams_url, notice: 'Exam was successfully updated.'
      else
        redirect_to edit_exam_path, notice: 'Exam was successfully updated.'
      end
    else
      render :edit
    end
  end

  # DELETE /exams/1
  def destroy
    @exam.destroy
    redirect_to exams_url, notice: 'Exam was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exam_params
      params.require(:exam).permit(:exam_code, :date, :name, :module_code, :status,
        :stations_attributes => [:station_id, :station_name, :pass_mark, :exam_id,
          :criteria_attributes => [:criteria_id, :criteria_description, :criteria_critical, :station_id]]
      )
    end
end
