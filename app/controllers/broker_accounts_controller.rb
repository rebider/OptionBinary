class BrokerAccountsController < ApplicationController
  before_action :set_broker_account, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @broker_accounts = BrokerAccount.all
    respond_with(@broker_accounts)
  end

  def show
    respond_with(@broker_account)
  end

  def new
    @broker_account = BrokerAccount.new
    respond_with(@broker_account)
  end

  def edit
  end

  def create
    @broker_account = BrokerAccount.new(broker_account_params)
    @broker_account.save
    respond_with(@broker_account)
  end

  def update
    @broker_account.update(broker_account_params)
    respond_with(@broker_account)
  end

  def destroy
    @broker_account.destroy
    respond_with(@broker_account)
  end

  private
    def set_broker_account
      @broker_account = BrokerAccount.find(params[:id])
    end

    def broker_account_params
      params.require(:broker_account).permit(:name, :user_id, :broker_id)
    end
end
