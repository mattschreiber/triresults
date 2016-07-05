module Api
	class ResultsController < RacesController

		#/api/races/:race_id/results
		def index
			if !request.accept || request.accept == "*/*"
				render plain: "/api/races/#{params[:race_id]}/results"
			else
				#real implementation ...
			end
		end

		#/api/races/:race_id/results/:id
		def show
			if !request.accept || request.accept == "*/*"
				render plain: "/api/races/#{params[:race_id]}/results/#{params[:id]}"
			else
				#real implementation ...
			end
		end
	end
end