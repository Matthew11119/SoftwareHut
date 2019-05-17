#Exams Controller controls interactions between the Model and Views for Exams

class ExamsController < ApplicationController
  include ExamsHelper
  require 'fileutils'
  require 'zip'

  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  authorize_resource

  # GET /exams
  def index
    if can?(:manage, Exam)
      index_admin
    else
      render template: 'errors/error_403', status: 403
    end
  end

  # GET /exams/1
  def show
    if can?(:manage, Exam)

    elsif can?(:edit, CriteriaResult)
      show_module_lead
    else
      render template: 'errors/error_403', status: 403
    end
  end

  # GET /exams/1 for Module Lead
  def show_module_lead
    @exam_show = Exam.where(:exam_code=>params[:id])
    @stations = Station.where(:exam_id=>params[:id])
    @station_show = @stations.paginate(:page => params[:station], :per_page=>10)
    render 'exams/show_module_lead'
  end




  #GET /results
  def results
    index_moderator # in exam helper
  end

  def import
    @exam = Exam.find(params[:id])
  end

  #post student_import
  def student_import
    @exam = Exam.find(params[:exam_code])
    @exam.student_import(params[:file])
    redirect_to edit_exam_path(@exam), notice: "Students added successfully"
  end

  #get 'results/:exam_code'
  def exam_results
    @exam = Exam.find(params[:exam_code])
    @students = @exam.students
    respond_to do |format|
      format.csv { send_data  @exam.to_csv }
      format.html { render :index_results }
    end
  end

  def exam_pdfs
    @exam = Exam.find(params[:exam_code])
    @students = @exam.students
    dirname = "tmp/exams/#{@exam.exam_code}_#{@exam.date}"
    @students.each do |student|
      unless Dir.exist?(dirname)
        FileUtils.mkdir_p(dirname)
      end
      unless File.file?("#{@exam.exam_code}_#{@exam.date}_#{student.username}.pdf")
        pdf = ResultPdf.new(student, @exam)
        pdf.render_file("tmp/exams/#{@exam.exam_code}_#{@exam.date}/#{@exam.exam_code}_#{@exam.date}_#{student.username}.pdf")
      end
      #station_results = StationResult.where( username: student.username, station_id: @exam.stations.pluck(:id) )
      #station_results.each do |station_result|
      #  attachment = (ActiveStorage::Attachment.find_by_record_id(station_result.id)).filename

      #end
      #station_results.map do |audio|
      #  filename = audio.filename.to_csv
      #  filepath = File.join dirname, filename
      #  File.open(filepath, 'wb') { |f| f.write(audio.download) }
      #  filepath
      #end
      station_results = StationResult.where( username: student.username, station_id: @exam.stations.pluck(:id) )
      station_results.each do |station_result|
        puts station_result.id
        begin
          attachment = (ActiveStorage::Attachment.find_by_record_id(station_result.id)).filename.to_s
          filepath = File.join(dirname, attachment)
          File.open(filepath, 'wb') { |f| f.write(ActiveStorage::Attachment.find_by_record_id(station_result.id).download) }
          filepath
        rescue
        end
      end
    end

    zipfile_name = "tmp/exams/#{@exam.exam_code}_#{@exam.date}/#{@exam.exam_code}_#{@exam.date}45.zip"
    input_filenames = Dir.entries(dirname).select {|f| !File.directory? f}
    input_filenames.each do |i|
      puts "Input filenames are " + i
    end
    unless File.file?(zipfile_name)
      puts "Unless run"
      Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
        puts "Open run"
        input_filenames.each do |filename|
          puts "Each run"
          puts "FILENAME = " + filename
          unless (File.extname(filename) == ".zip")
            unless (File.extname(filename) == ".pdf")
              zipfile.add(filename, File.join(dirname, filename))
            end
            #zipfile.add(filename, File.join(dirname, filename))
            zipfile.each do |i|
              puts i
            end
          end
        end
        #send_data(zipfile, :type => 'application/zip')

      end
    end

    send_file( File.join(dirname, "#{@exam.exam_code}_#{@exam.date}.zip"),
      :type => 'application/zip',
      :disposition => 'attachment',
     :filename => "#{@exam.exam_code}_#{@exam.date}.zip")

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
      redirect_to edit_exam_path(@exam.exam_code), notice: 'Exam was successfully created.'
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
