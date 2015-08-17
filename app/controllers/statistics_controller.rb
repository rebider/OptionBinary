class StatisticsController < ApplicationController
  before_action :authenticate_user!
  before_action :all_statistics, only: [:show, :trades_chart, :strategies_chart]

  include StatisticsHelper

  respond_to :html, :json

  @filter_begin_date
  @filter_end_date

  def index

  end



  def trades_chart
    
    set_filters

    @series = 
      [
        {
           # :name => "Won" ,
            :pointStart => @filter_begin_date.to_time.to_i * 1000,
            :pointInterval => 1.day.to_i * 1000,          
            :data => trades_chart_series(Trade.won.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]), @filter_begin_date, @filter_end_date) 
        },
        {
            #:name => "Tie" ,
            :pointStart => @filter_begin_date.to_time.to_i * 1000,
            :pointInterval => 1.day.to_i * 1000,  
            :data => trades_chart_series(Trade.tie.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]), @filter_begin_date, @filter_end_date) 
        },
        {
            #:name => "Lost" ,
            :pointStart => @filter_begin_date.to_time.to_i * 1000,
            :pointInterval => 1.day.to_i * 1000,  
            :data => trades_chart_series(Trade.lost.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]), @filter_begin_date, @filter_end_date) 
        },
        {
            #:name => "Profit" ,
            :data => trades_by_result(Trade.all_closed.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]), @filter_begin_date, @filter_end_date) 
        }
      ]


      respond_to do |format|
        format.json do 
          render :json =>  @series
        end
      end
  end

  def strategies_chart
    
    set_filters

    @series = 
      [
        {
           # :name => "Won" ,
          :data => trades_by_strategy(Trade.won.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]), @filter_begin_date, @filter_end_date)
        },
        {
            #:name => "Tie" ,
          :data => trades_by_strategy(Trade.tie.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]), @filter_begin_date, @filter_end_date)
        },
        {
            #:name => "Lost" ,
          :data => trades_by_strategy(Trade.lost.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]), @filter_begin_date, @filter_end_date)
        },
        {
          #Categories
          :data => Strategy.where(:id => Trade.all_closed.where(:User_id => current_user.id).group(:Strategy_id).pluck(:Strategy_id)).pluck(:Name)
        }
      ]

      respond_to do |format|
        format.json do 
          render :json => @series
        end
      end
  end

  def azzets_chart
    
    set_filters

    @series = 
      [
        {
           # :name => "Won" ,
          :data => trades_by_azzet(Trade.won.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]), @filter_begin_date, @filter_end_date)
        },
        {
            #:name => "Tie" ,
          :data => trades_by_azzet(Trade.tie.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]), @filter_begin_date, @filter_end_date)
        },
        {
            #:name => "Lost" ,
          :data => trades_by_azzet(Trade.lost.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]), @filter_begin_date, @filter_end_date)
        },
        {
          #Categories
          :data => Azzet.where(:id => Trade.all_closed.where(:User_id => current_user.id).group(:Azzet_id).pluck(:Azzet_id)).pluck(:Name)
        }
      ]

      respond_to do |format|
        format.json do 
          render :json => @series
        end
      end
  end

  def show
  end

  private

    def set_filters

      if params[:begin_date] != nil and params[:begin_date] != ""
        @filter_begin_date = params[:begin_date].to_date
      else
        @filter_begin_date = 5.days.ago
      end

      if params[:end_date] != nil and params[:end_date] != ""
        @filter_end_date = params[:end_date].to_date
      else
        @filter_end_date = Time.zone.today
      end

    end


    def all_statistics
      #@filter_begin_date = 5.days.ago
      #@filter_begin_date = 1.days.ago
    end

    def statistics_params
      params.require(:statistics).permit(:begin_date, :end_date, :brokers)
    end

end
