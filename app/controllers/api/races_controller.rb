module Api
	class RacesController < Api::BaseController
		#api/races
		def index
			if !request.accept || request.accept == "*/*"
				render plain: "/api/races, offset=[#{params[:offset]}], limit=[#{params[:limit]}]"
			else
				#real implementation ...
			end
		end
		#api/races/:id
		def show
			if !request.accept || request.accept == "*/*"
				render plain: "/api/races/#{params[:id]}"
			else
				#real implementation ...
			end
		end

		def create
			if !request.accept || request.accept == "*/*"
				# render plain: :nothing, status: :ok
				render plain: "#{params[:race][:name]}", status: :ok
			else
				@race = Race.create(race_params)
				render plain: "#{params[:race][:name]}", status: :created
			end
		end

		private
    	# Use callbacks to share common setup or constraints between actions.
    	def set_race
      	@race = Race.find(params[:id])
    	end

    	# Never trust parameters from the scary internet, only allow the white list through.
    	def race_params
      	params.require(:race).permit(:name, :date, :city, :state, :swim_distance, :swim_units, :bike_distance, :bike_units, :run_distance, :run_units)
    	end
	end

end