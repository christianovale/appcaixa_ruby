class TrasnferencesController < ApplicationController
  before_action :set_trasnference, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!
  
  # GET /trasnferences
  # GET /trasnferences.json
  def index
    @trasnferences = Trasnference.all
  end

  # GET /trasnferences/1
  # GET /trasnferences/1.json
  def show
  end

  # GET /trasnferences/new
  def new
    @trasnference = Trasnference.new
  end

  # GET /trasnferences/1/edit
  def edit
  end

  # POST /trasnferences
  # POST /trasnferences.json
  def create
    @trasnference = Trasnference.new(trasnference_params)

    received_account_id = trasnference_params[:contadestino]

    if (trasnference_params[:contadestino])
      @valid_account = Trasnference.where("id = '" + received_account_id + "'")
    end

    if (@valid_account.exists?)
      respond_to do |format|
        if @trasnference.save
          format.html { redirect_to @trasnference, notice: 'Trasnference was successfully created.' }
          format.json { render :show, status: :created, location: @trasnference }
        else
          format.html { render :new }
          format.json { render json: @trasnference.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = 'Operaçao não completada, a Conta ' + received_account_id.to_s + ' não é válida!'
      redirect_to new_trasnference_path
    end
  end

  # PATCH/PUT /trasnferences/1
  # PATCH/PUT /trasnferences/1.json
  def update
    respond_to do |format|
      if @trasnference.update(trasnference_params)
        format.html { redirect_to @trasnference, notice: 'Trasnference was successfully updated.' }
        format.json { render :show, status: :ok, location: @trasnference }
      else
        format.html { render :edit }
        format.json { render json: @trasnference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trasnferences/1
  # DELETE /trasnferences/1.json
  def destroy
    @trasnference.destroy
    respond_to do |format|
      format.html { redirect_to trasnferences_url, notice: 'Trasnference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trasnference
      @trasnference = Trasnference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trasnference_params
      params.require(:trasnference).permit(:data, :valor, :contadestino)
    end
end
