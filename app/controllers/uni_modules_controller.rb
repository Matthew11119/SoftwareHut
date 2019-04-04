class UniModulesController < ApplicationController
  before_action :set_uni_module, only: [:show, :edit, :update, :destroy]

  # GET /uni_modules
  def index
    @uni_modules = UniModule.all
  end


  # GET /uni_modules/new
  def new
    @uni_module = UniModule.new
    render layout: false
  end

  # GET /uni_modules/1/edit
  def edit
    render layout: false
  end

  # POST /uni_modules
  def create
    @uni_module = UniModule.new(uni_module_params)
    if @uni_module.save
      redirect_to students_path, notice: 'Uni module was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /uni_modules/1
  def update
    if @uni_module.update(uni_module_params)
      redirect_to students_path, notice: 'Uni module was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /uni_modules/1
  def destroy
    @uni_module.destroy
    redirect_to students_path, notice: 'Uni module was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uni_module
      @uni_module = UniModule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def uni_module_params
      params.require(:uni_module).permit(:module_code, :module_name)
    end
end
