class StatisticsController < ApplicationController

  def index
  end

  def show

  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def set_statistics_params
      params.permit()
    end
end
