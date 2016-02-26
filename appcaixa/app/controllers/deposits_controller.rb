class DepositsController < ApplicationController
  before_action :set_deposit, only: [:show, :edit, :update, :destroy]

  # GET /deposits
  # GET /deposits.json
  def index

    @deposits = Deposit.all
    @trasnferences = Trasnference.all
    @whithdraws = Whithdraw.all
    @accounts = Account.all
  end

  # GET /deposits/1
  # GET /deposits/1.json
  def show
  end

  # GET /deposits/new
  def new
    @deposit = Deposit.new
  end

  # GET /deposits/1/edit
  def edit
  end

  # POST /deposits
  # POST /deposits.json
  def create
    @deposit = Deposit.new(deposit_params)

    received_account_id = deposit_params[:account_id]
    received_value = BigDecimal(deposit_params[:valor])

    if (@deposit.account)
      @valid_account = Account.find(@deposit.account)
    end

      if (@valid_account)
        respond_to do |format|
        if @deposit.save
          @valid_account.saldo += received_value
          @valid_account.save
          format.html { redirect_to @deposit, notice: 'Deposit was successfully created.' }
          format.json { render :show, status: :created, location: @deposit }
        else
          format.html { render :new }
          format.json { render json: @deposit.errors, status: :unprocessable_entity }
        end
        end
      else
        flash[:alert] = 'Operaçao não completada, a Conta ' + received_account_id.to_s + ' não é válida!'
        redirect_to new_deposit_path
      end
  end

  # PATCH/PUT /deposits/1
  # PATCH/PUT /deposits/1.json
  def update
    respond_to do |format|
      if @deposit.update(deposit_params)
        format.html { redirect_to @deposit, notice: 'Deposit was successfully updated.' }
        format.json { render :show, status: :ok, location: @deposit }
      else
        format.html { render :edit }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deposits/1
  # DELETE /deposits/1.json
  def destroy
    @deposit.destroy
    respond_to do |format|
      format.html { redirect_to deposits_url, notice: 'Deposit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deposit
      @deposit = Deposit.find(params[:id])


    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deposit_params
      params.require(:deposit).permit(:data, :valor, :account_id)
    end
end
