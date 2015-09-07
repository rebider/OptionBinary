class BrokerAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_broker_account, only: [:show, :edit, :update, :destroy, :current_balance]

  respond_to :html

  def index
    @broker_accounts = BrokerAccount.user_brokerAccounts(current_user.id)
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

=begin
    AccountBalance.create(
      :broker_account_id => @broker_account.id,
      :Amount  => Float(@broker_account.Balance),
      :Balance => Float(@broker_account.Balance), 
      :TradeID => '', 
      :Type => "Manual",
      :user_id => current_user.id)
=end

    respond_to do |format|
      if @broker_account.save
        format.html { redirect_to '/broker_accounts'}
        format.json { render :show, status: :created, location: @broker_account }
      else
        format.html { render :new }
        format.json { render json: @broker_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

   # @old_balance = @broker_account.Balance
    @broker_account.update(broker_account_params)

=begin
    if(@old_balance != @broker_account.Balance)
    
      AccountBalance.create(
        :broker_account_id => @broker_account.id,
        :Amount  => Float(@broker_account.Balance) - Float(@old_balance),
        :Balance => Float(@broker_account.Balance), 
        :TradeID => '', 
        :Type => "Manual",
        :user_id => current_user.id)
    end
=end


    respond_with(@broker_account)
  end

  def destroy
    @broker_account.destroy
    respond_with(@broker_account)
  end

  def current_balance
    
    respond_to do |format|
       format.json do 
        render :json => @broker_account.Balance
      end
     end
  end

  private
    def set_broker_account
      @broker_account = BrokerAccount.find(params[:id])
    end

    def broker_account_params
      params.require(:broker_account).permit(:name, :user_id, :broker_id, :DemoAccount, :Balance)
    end
end
