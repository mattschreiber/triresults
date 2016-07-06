module Api
	class RacesController < Api::BaseController
		#api/races
		before_action :set_race, only: [:show, :edit, :update, :destroy]
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
				# respond_with @race
				render json: @race
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

		def update
			# @race.update_attributes(race_params)
			# render json: @race
      if @race.update(race_params)
				render json: @race
      else
      	render json: @race.errors, status: :unprocessable_entity
    	end
		end

		private
    	# Use callbacks to share common setup or constraints between actions.
    	def set_race
      	@race = Race.find(params[:id])

        rescue Mongoid::Errors::DocumentNotFound => e
          respond_to do |format|
            format.json { render json: {msg:"race[#{params[:id]}] not found"}, status: :not_found }
          end
    	end

    	# Never trust parameters from the scary internet, only allow the white list through.
    	def race_params
      	params.require(:race).permit(:name, :date, :city, :state, :swim_distance, :swim_units, :bike_distance, :bike_units, :run_distance, :run_units)
    	end
	end

end