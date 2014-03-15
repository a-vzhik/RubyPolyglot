class TermRequestsController < ApplicationController
  before_action :set_term_request, only: [:show, :edit, :update, :destroy]

  # GET /term_requests
  # GET /term_requests.json
  def index
    @term_requests = TermRequest.all
  end

  # GET /term_requests/1
  # GET /term_requests/1.json
  def show
  end

  # GET /term_requests/new
  def new
    @term_request = TermRequest.new
  end

  # GET /term_requests/1/edit
  def edit
  end

  # POST /term_requests
  # POST /term_requests.json
  def create
    @term_request = TermRequest.new(term_request_params)

    respond_to do |format|
      if @term_request.save
        format.html { redirect_to @term_request, notice: 'Term request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @term_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @term_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /term_requests/1
  # PATCH/PUT /term_requests/1.json
  def update
    respond_to do |format|
      if @term_request.update(term_request_params)
        format.html { redirect_to @term_request, notice: 'Term request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @term_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /term_requests/1
  # DELETE /term_requests/1.json
  def destroy
    @term_request.destroy
    respond_to do |format|
      format.html { redirect_to term_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_term_request
      @term_request = TermRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def term_request_params
      params.require(:term_request).permit(:datetime, :term)
    end
end
