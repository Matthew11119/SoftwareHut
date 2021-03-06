#Answers Controller controls interactions between the user and Views for archived exams

class ArchivesController < ApplicationController
  before_action :set_archive, only: [:read, :edit, :update, :destroy]
  skip_load_and_authorize_resource
  
  # GET /archives
  def index
    @archives = Exam.archive
    render :index
  end

  # GET /archives/1/edit
  def edit
  end

  # PATCH/PUT /archives/1
  def update
    if @archive.update(archive_params)
      redirect_to @archive, notice: 'Archive was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /archives/1
  def destroy
    @archive.destroy
    redirect_to archives_url, notice: 'Archive was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Exam.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def archive_params
      params.fetch(:archive, {})
    end
end
