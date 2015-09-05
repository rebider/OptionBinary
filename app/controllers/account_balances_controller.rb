class AccountBalancesController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_account_balance, only: [:show, :edit, :update, :destroy]
  before_action :set_account_balance, only: [:show]

  respond_to :html

  # GET /account_balances
  # GET /account_balances.json
  def index
    @account_balances = AccountBalance.user_balances(current_user.id)
    @broker = BrokerAccount.user_brokerAccounts(:user_id => current_user.id)
  end

  # GET /account_balances/1
  # GET /account_balances/1.json
  def show
  end
=begin
  # GET /account_balances/new
  def new
    @account_balance = AccountBalance.new
  end

  # GET /account_balances/1/edit
  def edit
  end

  # POST /account_balances
  # POST /account_balances.json
  def create

    @account_balance    = AccountBalance.new(
      :broker_account_id => params[:broker_account_id], 
      :Amount  => params[:Amount], 
      :Type    => params[:Type],
      :TradeID => params[:TradeID],
      :Balance => params[:Amount],
      :user_id => current_user.id
      )

    respond_to do |format|
      if @account_balance.save
        format.html { redirect_to '/account_balances'}
        format.json { render :show, status: :created, location: @account_balance }
      else
        format.html { render :new }
        format.json { render json: @account_balance.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /account_balances/1
  # PATCH/PUT /account_balances/1.json
  def update
    respond_to do |format|
      if @account_balance.update(account_balance_params)
        format.html { redirect_to @account_balance}
        format.json { render :show, status: :ok, location: @account_balance }
      else
        format.html { render :edit }
        format.json { render json: @account_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_balances/1
  # DELETE /account_balances/1.json
  def destroy
    @account_balance.destroy
    respond_to do |format|
      format.html { redirect_to account_balances_url, notice: 'Account balance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
=end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_balance
      @account_balance = AccountBalance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_balance_params
      params.require(:account_balance).permit(:broker_account_id, :Amount, :Type, :TradeID, :Balance, :user_id)
    end
end
