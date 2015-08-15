class StatisticsController < ApplicationController
  before_action :authenticate_user!
  before_action :all_statistics, only: [:show, :filter_data]

  respond_to :html, :json

  def index

	 @rango_fechas = Trade.where(:User_id => current_user.id).where(created_at: "2015-07-15"..Time.zone.now).group("date(created_at)")

   
    if params[:begin_date] != nil
      @filter_begin_date = (params[:begin_date]).to_date
    else
      @filter_begin_date = 5.days.ago
    end

    if params[:end_date] != nil
      @filter_end_date = (params[:end_date]).to_date
    else
      @filter_end_date = Time.zone.today
    end



    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Population vs GDP For 5 Big Countries [2009]")
      f.xAxis(:type => "datetime")

      { "Won" => Trade.won.where(:User_id => current_user.id), 
        "Tie" => Trade.tie.where(:User_id => current_user.id), 
        "Lost" => Trade.lost.where(:User_id => current_user.id) }.each do |name, trades|

        f.series(:name => name, 
          :pointInterval => (3.day.to_i * 1000), 
          :pointStart => (3.weeks.ago.to_i * 1000), 
          :data => [1,2,3,4,5])
        
      end

      f.yAxis [
        {:title => {:text => "GDP in Billions", :margin => 70} }
        #{:title => {:text => "Population in Millions"}, :opposite => true},
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"column"})
    end

  end


  def filter_data

    @filter_begin_date = (params[:begin_date]).to_date
    @filter_end_date = (params[:end_date]).to_date

    respond_to do |format|
       format.json do 
        render :json => @filter_begin_date
      end
     end

  end

  def show
  end

  private

    def all_statistics
      #@filter_begin_date = 5.days.ago
      #@filter_begin_date = 1.days.ago
    end

    def statistics_params
      params.require(:statistics).permit(:begin_date, :end_date, :brokers)
    end

end
