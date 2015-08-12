class StatisticsController < ApplicationController
  def index

  	@start = 3.weeks.ago
  	@fechaf = Time.zone.today


  end
end
