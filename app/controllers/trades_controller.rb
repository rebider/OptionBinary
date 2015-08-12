class TradesController < ApplicationController
  before_action :authenticate_user!
  before_action :all_trades, only: [:index, :create, :update, :destroy]
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    #@trades = Trade.all
    @trades = Trade.where(:User_id => current_user.id)
    respond_with(@trades)
  end

  def show
    respond_with(@trade)
  end

  def new
    @brokerAccount = BrokerAccount.where(:user_id => current_user.id)#.pluck(:broker_id)
    #@Brokername =    BrokerAccount.where(:broker_id => @BrokerAccount).pluck(:name)
    #@Brokers = Broker.where(:id => @BrokerAccount).pluck(:Name)
    #@broker_accounts = BrokerAccount.all
    #@nombre = "#{@BrokerAccount} - #{@Brokers}"
    @strategy = Strategy.where(:User_id => current_user.id)
    #logger.debug @nombre
    @trade = Trade.new
    respond_with(@trade)
  end

  

  def edit
  end

  def create
    @trade = Trade.new(trade_params)
    #@trade.save
    #respond_with(@trade)

    #if @trade.save
        #format.html { redirect_to '/dashboard/', notice: 'Post was successfully updated.' }
        #format.json { render :show, status: :ok, location: '/dashboard' }
    #end
  end

  def update
    @trade.update(trade_params)
    #respond_with(@trade)
  end

  def destroy
    @trade.destroy
    #respond_with(@trade)
  end

  private

    def all_trades
      @trades = Trade.where(:User_id => current_user.id)
    end

    def set_trade
      @trade = Trade.find(params[:id])
    end

    def trade_params
      params.require(:trade).permit(:User_id, :BrokerAccount_id, :Strategy_id, :Azzet_id, :Option, :Amount, :OnProfit, :OnLoss, :Payout, :Result, :UseMartingale, :UseCompoundInterest)
    end

end
