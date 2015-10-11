class DashboardController < ApplicationController
  include DashboardHelper
  before_action :authenticate_user!
	before_action :set_dashboard, only: [:show]
  before_action :all_trades, only: [:index, :create, :update, :destroy, :update_result]
  before_action :set_trades, only: [:edit, :update, :destroy, :update_result]
	
	respond_to :html, :json

  def new
    @brokerAccount = BrokerAccount.user_brokerAccounts(current_user.id)

    @strategy = Strategy.user_strategies(current_user.id)

    @azzets = Azzet.get_azzets

    @trade = Trade.new
  end

  def create
    @trade = Trade.create(trade_params)
  end

  def update
    @trade.update_attributes(trade_params)
  end

  def destroy
    @trade.destroy
  end

  def index

  end

  def update_result

    @trade.Result = params[:Result]

    if(params[:Result] == 'WON')
      @trade.Payout = ((Float(@trade.Amount) * Float(@trade.OnProfit)) / 100)
    elsif (params[:Result] == 'TIE') 
      @trade.Payout = 0
    else
      @trade.Payout = 0 - Float(@trade.Amount) + (Float(@trade.Amount) * Float(@trade.OnLoss)) / 100
    end
    
    @trade.save

    @account = BrokerAccount.find(@trade.BrokerAccount_id)
    @account.Balance = Float(@account.Balance) + Float(@trade.Payout)
    @account.save


=begin
    if(params[:Result] == 'WON')
      @trade.Payout = ((Float(@trade.Amount) * Float(@trade.OnProfit)) / 100)
      @pago      = AccountBalance.where(:broker_account_id => @trade.BrokerAccount_id).pluck(:Balance).last
      @total     = (Float(@pago) + Float(@trade.Payout))
      @actualiza = AccountBalance.create(
        :broker_account_id => @trade.BrokerAccount_id,
        :Amount  => Float(@trade.Payout),
        :Balance => @total, 
        :TradeID => @trade.id, 
        :Type => "Trade",
        :user_id => current_user.id)

      @account = BrokerAccount.find(@trade.BrokerAccount_id)
      @account.Balance = Float(@account.Balance) + Float(@trade.Payout)
      @account.save

    elsif (params[:Result] == 'TIE') 
      @trade.Payout = 0#Float(@trade.Amount)
      @pago      = AccountBalance.where(:broker_account_id => @trade.BrokerAccount_id).pluck(:Balance).last
      @total     = (Float(@pago) + Float(@trade.Payout))
      @actualiza = AccountBalance.create(
        :broker_account_id => @trade.BrokerAccount_id,
        :Amount  => Float(@trade.Payout),
        :Balance => @total, 
        :TradeID => @trade.id, 
        :Type => "Trade",
        :user_id => current_user.id)

      @account = BrokerAccount.find(@trade.BrokerAccount_id)
      @account.Balance = Float(@account.Balance) + Float(@trade.Payout)
      @account.save

    else
      @trade.Payout = 0 - Float(@trade.Amount) + (Float(@trade.Amount) * Float(@trade.OnLoss)) / 100
      @pago      = AccountBalance.where(:broker_account_id => @trade.BrokerAccount_id).pluck(:Balance).last
      @total     = (Float(@pago) + Float(@trade.Payout))
      @actualiza = AccountBalance.create(
        :broker_account_id => @trade.BrokerAccount_id,
        :Amount  => Float(@trade.Payout),
        :Balance => @total, 
        :TradeID => @trade.id, 
        :Type => "Trade",
        :user_id => current_user.id)

      @account = BrokerAccount.find(@trade.BrokerAccount_id)
      @account.Balance = Float(@account.Balance) + Float(@trade.Payout)
      @account.save
      
    end
=end



  end

  def today_data
    
    respond_to do |format|
        format.json do 
          render :json => day_full_data(Time.zone.today)
        end
      end
  end

  private

    def all_trades
      @trades = Trade.open_trades(current_user.id).order(:id)
    end

    def set_trades
      @trade = Trade.find(params[:id])
    end

    def trade_params
      params.require(:trade).permit(:User_id, :BrokerAccount_id, :Strategy_id, :Azzet_id, :Option, :Amount, :OnProfit, :OnLoss, :Payout, :Result, :UseMartingale, :UseCompoundInterest, :Position)
    end

end

