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
				@result=Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
				render :partial=>"result", :object=>@result
			end
		end

		def update
			entrant=Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
			result=result_params
			if result
				if result[:swim]
					entrant.swim=entrant.race.race.swim
					entrant.swim_secs = result[:swim].to_f
				end
				if result[:t1]
					entrant.t1=entrant.race.race.t1
					entrant.t1_secs = result[:t1].to_f
				end
				if result[:bike]
					entrant.bike=entrant.race.race.bike
					entrant.bike_secs = result[:bike].to_f
				end
				if result[:t2]
					entrant.t2=entrant.race.race.t2
					entrant.t2_secs = result[:t2].to_f
				end
				if result[:run]
					entrant.run=entrant.race.race.run
					entrant.run_secs = result[:run].to_f
				end
			entrant.save
			render :nothing=>true, status: :ok
			end
		end

		private
    	# Never trust parameters from the scary internet, only allow the white list through.
    	def result_params
      	params.require(:result).permit(:swim, :t1, :bike, :t2, :run)
    	end

	end
end