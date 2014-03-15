class TranslationServicesController < ApplicationController
  before_action :set_translation_service, only: [:show, :edit, :update, :destroy]

  # GET /translation_services
  # GET /translation_services.json
  def index
    @translation_services = TranslationService.all
  end

  # GET /translation_services/1
  # GET /translation_services/1.json
  def show
  end

  # GET /translation_services/new
  def new
    @translation_service = TranslationService.new
  end

  # GET /translation_services/1/edit
  def edit
  end

  # POST /translation_services
  # POST /translation_services.json
  def create
    @translation_service = TranslationService.new(translation_service_params)

    respond_to do |format|
      if @translation_service.save
        format.html { redirect_to @translation_service, notice: 'Translation service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @translation_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @translation_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translation_services/1
  # PATCH/PUT /translation_services/1.json
  def update
    respond_to do |format|
      if @translation_service.update(translation_service_params)
        format.html { redirect_to @translation_service, notice: 'Translation service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @translation_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translation_services/1
  # DELETE /translation_services/1.json
  def destroy
    @translation_service.destroy
    respond_to do |format|
      format.html { redirect_to translation_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translation_service
      @translation_service = TranslationService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translation_service_params
      params.require(:translation_service).permit(:name, :url)
    end
end
