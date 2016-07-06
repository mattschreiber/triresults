module Api
	class ResultsController < RacesController

		#/api/races/:race_id/results
		def index
			if !request.accept || request.accept == "*/*"
				render plain: "/api/races/#{params[:race_id]}/results"
			else
				#real implementation ...
				@result=Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
				render :partial=>"result", :object=>@result
			end
		end

		#/api/races/:race_id/results/:id
		def show
			if !request.accept || request.accept == "*/*"
				render plain: "/api/races/#{params[:race_id]}/results/#{params[:id]}"
			else
				@result=Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
			end
		end
	end
end