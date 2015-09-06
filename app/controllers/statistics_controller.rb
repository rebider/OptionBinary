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

    trades_data = ""
    if params[:strategy].nil?
      trades_data = Trade.all_closed.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]).where(:created_at => @filter_begin_date.beginning_of_day..@filter_end_date.end_of_day)
    else
      trades_data = Trade.all_closed.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]).where(:Strategy_id => params[:strategy]).where(:created_at => @filter_begin_date.beginning_of_day..@filter_end_date.end_of_day)
    end

    @series = 
      [
        {
           # :name => "Won" ,
            :pointStart => @filter_begin_date.to_time.to_i * 1000,
            :pointInterval => 1.day.to_i * 1000,          
            #:data => trades_chart_series(Trade.won.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]).where(:Strategy_id => params[:strategy]), @filter_begin_date, @filter_end_date) 
            :data => trades_chart_series(trades_data.won, @filter_begin_date, @filter_end_date)
        },
        {
            #:name => "Tie" ,
            :pointStart => @filter_begin_date.to_time.to_i * 1000,
            :pointInterval => 1.day.to_i * 1000,  
            #:data => trades_chart_series(Trade.tie.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]).where(:Strategy_id => params[:strategy]), @filter_begin_date, @filter_end_date) 
            :data => trades_chart_series(trades_data.tie, @filter_begin_date, @filter_end_date)
        },
        {
            #:name => "Lost" ,
            :pointStart => @filter_begin_date.to_time.to_i * 1000,
            :pointInterval => 1.day.to_i * 1000,  
            #:data => trades_chart_series(Trade.lost.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]).where(:Strategy_id => params[:strategy]), @filter_begin_date, @filter_end_date) 
            :data => trades_chart_series(trades_data.lost, @filter_begin_date, @filter_end_date)
        },
        {
            #:name => "Profit" ,
            :pointStart => @filter_begin_date.to_time.to_i * 1000,
            :pointInterval => 1.day.to_i * 1000, 
            :data => profit_chart_series(trades_data, @filter_begin_date, @filter_end_date) 
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

    trades_data = Trade.all_closed.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]).where(:Strategy_id => params[:strategy]).where(:created_at => @filter_begin_date.beginning_of_day..@filter_end_date.end_of_day)
    categories_data = Strategy.where(:id => trades_data.group(:Strategy_id).pluck(:Strategy_id))

    @series = 
      [
        {
           #"Won" 
          :data => trades_by_strategy(trades_data.won, categories_data, @filter_begin_date, @filter_end_date)
        },
        {
            #"Tie" 
          :data => trades_by_strategy(trades_data.tie, categories_data, @filter_begin_date, @filter_end_date)
        },
        {
            #"Lost" 
          :data => trades_by_strategy(trades_data.lost, categories_data, @filter_begin_date, @filter_end_date)
        },
        {
          #Categories
          :data => categories_data.pluck(:Name)
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
          :data => trades_by_azzet(Trade.won.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]).where(:Strategy_id => params[:strategy]), @filter_begin_date, @filter_end_date)
        },
        {
            #:name => "Tie" ,
          :data => trades_by_azzet(Trade.tie.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]).where(:Strategy_id => params[:strategy]), @filter_begin_date, @filter_end_date)
        },
        {
            #:name => "Lost" ,
          :data => trades_by_azzet(Trade.lost.where(:User_id => current_user.id).where(:BrokerAccount_id => params[:account]).where(:Strategy_id => params[:strategy]), @filter_begin_date, @filter_end_date)
        },
        {
          #Categories
          :data => Azzet.where(:id => Trade.all_closed.where(:User_id => current_user.id).where(:Strategy_id => params[:strategy]).group(:Azzet_id).pluck(:Azzet_id)).pluck(:Name)
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
