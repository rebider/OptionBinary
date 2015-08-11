module StatisticsHelper

	def fecha
		start = 3.weeks.ago
		(start.to_date..Time.zone.today).map do |fecha|
				{	
				 date:  fecha
				}

		end
	end	
end
