class StatisticsController < ApplicationController
  #before_action :set_statistics, only: [:today_scores]
  before_action :all_trades, only: [:index, :today_scores]
  
  respond_to :html, :json

  def index
  	#render :json => @trades.as_json(:only => [:id, :Result, :created_at])
  	#render :json => Trade.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).as_json(:only => [:id, :Result])

  	render :json => @trades.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day)
  					.group(:Result).count('id')

  end

  def show

  end


    def today_scores
  	#DateTime.now.beginning_of_day, DateTime.now.end_of_day
  	
  	render :json => @trades.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day)
  					.group(:Result).count('id')
  
    end


  private

    def all_trades
      @trades = Trade.where(:User_id => current_user.id).where.not(:Result => '')
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_statistics
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def set_statistics_params
      params.permit(:begindate, :enddate)
    end
end
