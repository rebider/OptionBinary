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
   	@balance_win  = Trade.where(:User_id => current_user.id).where(created_at: "2015-07-15"..Time.zone.now).where("BrokerAccount_id in (?)", [2,3]).group("date(created_at)")
   	@suma_win     = @balance_win.sum(:Payout)
   	######### fin grafica 2 #####
   	######### grafica 1
    # @categorias2  = BrokerAccount.where("id in (?)", [2,3])
    # @categorias2.each do |e|
    # #@categorias2  = BrokerAccount.where(:id => 2)
    # @join = AccountBalance.where(:broker_account_id => e.id).pluck("Amount")
    # 	Rails.logger.info "Resultado #{@join}  "
    # end
       
   @sum   = Trade.select("Amount","Payout","created_at").where(:User_id => current_user.id).where(created_at: "2015-07-15"..Time.zone.now).where(result: "WIN").where("BrokerAccount_id in (?)", [2,3]).group("date(created_at)")
   Rails.logger.info "Suma #{@sum.sum(:Amount)} "

   @suma  = @sum.group_by { |t| 
   	t = (Float(t.Amount) + Float(t.Payout))
   }

 	######### fin grafica 3 #####
 
  end
end
