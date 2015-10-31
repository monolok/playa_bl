class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :_view_pdf]
  #before_action :authenticate_user!

  # GET /clients
  # GET /clients.json
  def index
    if params[:search].present?
      if params[:search].to_i != 0
        @clients = Client.search_id(params[:search])
      else
        @clients = Client.search(params[:search])
      end
    else
      @clients = Client.all.limit(7).order(created_at: :desc)
    end

    @client_all = Client.all.order(created_at: :desc)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  def _view_pdf
    send_data(Base64.decode64(@client.document.data), :type => @client.document.mime_type, :filename => @client.document.filename, :disposition => 'inline')
  end

  # GET /clients/new
  def new
    @client = Client.new
    @document = @client.build_document
    @danger = [["Accept with cautious", 1], ["Do not accept", 2]]
  end

  # GET /clients/1/edit
  def edit
    @danger = [["Accept with cautious", 1], ["Do not accept", 2]]
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    if not params[:client][:document].nil?
      @document = @client.build_document(:name => params[:client][:document][:data].original_filename) do |t|
        t.data = Base64.encode64(params[:client][:document][:data].read)
        t.filename = params[:client][:document][:data].original_filename
        t.mime_type = params[:client][:document][:data].content_type
      end
    end

    respond_to do |format|
      if @client.save || @document.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :country, :national_id, :address, :image_id, :danger, :comment, document_attributes: [:id, :name])
    end

end
