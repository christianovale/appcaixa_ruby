class WhithdrawsController < ApplicationController
  before_action :set_whithdraw, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  # GET /whithdraws
  # GET /whithdraws.json
  def index
    @whithdraws = Whithdraw.all
  end

  # GET /whithdraws/1
  # GET /whithdraws/1.json
  def show
  end

  # GET /whithdraws/new
  def new
    @whithdraw = Whithdraw.new
  end

  # GET /whithdraws/1/edit
  def edit
  end

  # POST /whithdraws
  # POST /whithdraws.json
  def create
    @whithdraw = Whithdraw.new(whithdraw_params)

    received_account_id = whithdraw_params[:account_id]
    received_value = BigDecimal(whithdraw_params[:valor])

    if (@whithdraw.account)
      @valid_account = Account.find(@whithdraw.account)
    end

    if(received_value <= @valid_account.saldo)
        respond_to do |format|
        if @whithdraw.save
          @valid_account.saldo -= received_value
          @valid_account.save
          format.html { redirect_to @whithdraw, notice: 'Whithdraw was successfully created.' }
          format.json { render :show, status: :created, location: @whithdraw }
        else
          format.html { render :new }
          format.json { render json: @whithdraw.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = 'Operaçao não completada, Saldo indisponivel'
      redirect_to new_whithdraw_path
    end

    
  end

  # PATCH/PUT /whithdraws/1
  # PATCH/PUT /whithdraws/1.json
  def update
    respond_to do |format|
      if @whithdraw.update(whithdraw_params)
        format.html { redirect_to @whithdraw, notice: 'Whithdraw was successfully updated.' }
        format.json { render :show, status: :ok, location: @whithdraw }
      else
        format.html { render :edit }
        format.json { render json: @whithdraw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whithdraws/1
  # DELETE /whithdraws/1.json
  def destroy
    @whithdraw.destroy
    respond_to do |format|
      format.html { redirect_to whithdraws_url, notice: 'Whithdraw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whithdraw
      @whithdraw = Whithdraw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def whithdraw_params
      params.require(:whithdraw).permit(:data, :valor, :account_id)
    end
end
