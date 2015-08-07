class StatisticsController < ApplicationController
  def index
  	######### grafica 1
  	@categorias = Trade.where(:User_id => current_user.id).where(created_at: "2015-07-15"..Time.zone.now).group("date(created_at)") 
  	@win        = Trade.where(:User_id => current_user.id).where(created_at: "2015-07-15"..Time.zone.now).where(result: "WIN").group("date(created_at)") 
  	@tie        = Trade.where(:User_id => current_user.id).where(created_at: "2015-07-15"..Time.zone.now).where(result: "TIE").group("date(created_at)") 
  	@lost       = Trade.where(:User_id => current_user.id).where(created_at: "2015-07-15"..Time.zone.now).where(result: "LOST").group("date(created_at)") 
    ######### fin grafica 1 #####
    ######### grafica 2
  	@categorias1  = Trade.where(:User_id => current_user.id).where(created_at: "2015-07-15"..Time.zone.now).group("date(created_at)") 
   	@balance_win  = Trade.where(:User_id => current_user.id).where(created_at: "2015-07-15"..Time.zone.now).where("BrokerAccount_id in (?)", [1,2]).group("date(created_at)")
   	@suma_win     = @balance_win.sum(:Payout)
   	######### fin grafica 2 #####
   	######### grafica 1
    @categorias2  = BrokerAccount.where("id in (?)", [2,3]).group("name")
   	@balance_acum = AccountBalance.where("broker_account_id in (?)", [2,3]).group("broker_account_id")
   	@suma_balance = @balance_acum.sum(:Amount)
   	#Rails.logger.info "current_user #{@balance_acum.sum(:Amount)}"
 	######### fin grafica 3 #####
  end
end
