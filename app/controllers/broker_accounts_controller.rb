class BrokerAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_broker_account, only: [:show, :edit, :update, :destroy]

  # GET /broker_accounts
  # GET /broker_accounts.json
  def index
    @broker_accounts = BrokerAccount.all
  end

  # GET /broker_accounts/1
  # GET /broker_accounts/1.json
  def show
  end

  # GET /broker_accounts/new
  def new
    @broker_account = BrokerAccount.new
  end

  # GET /broker_accounts/1/edit
  def edit
  end

  # POST /broker_accounts
  # POST /broker_accounts.json
  def create
    @broker_account = BrokerAccount.new(broker_account_params)

    respond_to do |format|
      if @broker_account.save
        format.html { redirect_to @broker_account, notice: 'Broker account was successfully created.' }
        format.json { render :show, status: :created, location: @broker_account }
      else
        format.html { render :new }
        format.json { render json: @broker_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /broker_accounts/1
  # PATCH/PUT /broker_accounts/1.json
  def update
    respond_to do |format|
      if @broker_account.update(broker_account_params)
        format.html { redirect_to @broker_account, notice: 'Broker account was successfully updated.' }
        format.json { render :show, status: :ok, location: @broker_account }
      else
        format.html { render :edit }
        format.json { render json: @broker_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broker_accounts/1
  # DELETE /broker_accounts/1.json
  def destroy
    @broker_account.destroy
    respond_to do |format|
      format.html { redirect_to broker_accounts_url, notice: 'Broker account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broker_account
      @broker_account = BrokerAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def broker_account_params
      params.require(:broker_account).permit(:User_id, :Broker_id)
    end
end
