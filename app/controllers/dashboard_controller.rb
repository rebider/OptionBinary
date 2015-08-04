class DashboardController < ApplicationController
	before_action :set_dashboard, only: [:show]
  before_action :all_trades, only: [:index, :create, :update, :destroy]
  before_action :set_trades, only: [:edit, :update, :destroy, :update_result]
	
	respond_to :html, :json

  def new

    @brokerAccount = BrokerAccount.where(:user_id => current_user.id)
    @strategy = Strategy.where(:User_id => current_user.id)
    @azzets = Azzet.order(:Name)

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

    if(params[:Result] == 'WIN')
      @trade.Payout = Float(@trade.Amount) + ((Float(@trade.Amount) * Float(@trade.OnProfit)) / 100)
    elsif (params[:Result] == 'TIE') 
      @trade.Payout = Float(@trade.Amount)
    else
      @trade.Payout = (Float(@trade.Amount) * Float(@trade.OnLoss)) / 100
    end
    @trade.save


  end

  private

    def all_trades
      @trades = Trade.where(:User_id => current_user.id).where(:Result => '')

      ## perform a paginated query:
      @closedTrades = Trade.where(:User_id => current_user.id).where.not(:Result => '').paginate(:page => params[:page], :per_page => 10)

    end

    def set_trades
      @trade = Trade.find(params[:id])
    end

    def trade_params
      #params.require(:trade).permit(:id, :Result)
      params.require(:trade).permit(:User_id, :BrokerAccount_id, :Strategy_id, :Azzet_id, :Option, :Amount, :OnProfit, :OnLoss, :Payout, :Result, :UseMartingale, :UseCompoundInterest)
    end
end

