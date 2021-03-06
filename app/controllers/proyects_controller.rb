class ProyectsController < ApplicationController
  before_action :set_proyect, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show
  before_action :find_the_experience
  layout "back_end_application", except: :show

  # GET /proyects
  # GET /proyects.json
  def index
    @proyects = @experience.proyects
    authorize Proyect
  end

  # GET /proyects/1
  # GET /proyects/1.json
  def show
   # if request.path != experience_proyect_path(@proyect)
   #   return redirect_to @proyect, :status => :moved_permanently
   # end
  end


  # GET /proyects/new
  def new
    @proyect = Proyect.new
    authorize Proyect
  end

  # GET /proyects/1/edit
  def edit
      @proyects = Proyect.includes(:experience,:translations)
      @experiences = Experience.includes(:proyects,:translations).order(start_date: :desc)
      authorize Proyect
  end

  # POST /proyects
  # POST /proyects.json
  def create
    @proyect = @experience.proyects.build(proyect_params)

    respond_to do |format|
      if @proyect.save
        format.html { redirect_to [@experience,@proyect], notice: 'Proyect was successfully created.' }
        format.json { render action: 'show', status: :created, location: @proyect }
      else
        format.html { render action: 'new' }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
    authorize Proyect
  end

  # PATCH/PUT /proyects/1
  # PATCH/PUT /proyects/1.json
  def update
    respond_to do |format|
      if @proyect.update(proyect_params)
        format.html { redirect_to [@experience,@proyect], notice: 'Proyect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
    authorize Proyect
  end

  # DELETE /proyects/1
  # DELETE /proyects/1.json
  def destroy
    @proyect.destroy
    respond_to do |format|
      format.html { redirect_to proyects_url }
      format.json { head :no_content }
    end
    authorize Proyect
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyect
      @proyect = Proyect.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyect_params
      params.require(:proyect).permit(:name, :start_time, :end_time, :position, :activities, :outstaning, :tools, :description, :cover,:link,:logo,:activity_description, :category, :experience_id,:actual)
    end

    def find_the_experience
      @experience = Experience.friendly.find(params[:experience_id])
    end
end
