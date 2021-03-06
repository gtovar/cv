class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show
  layout "back_end_application"

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.includes(:translations)
    authorize Experience
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
      authorize Experience
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
    authorize Experience
  end

  # GET /experiences/1/edit
  def edit
      authorize Experience
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render action: 'show', status: :created, location: @experience }
      else
        format.html { render action: 'new' }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
    authorize Experience
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url }
      format.json { head :no_content }
    end
    authorize Experience
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
        params.require(:experience).permit(:name, :description, :start_date, :end_date, :actual, :position)
    end
end
