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
				@race = Race.find(params[:id])
				render :template => 'races/show'
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
			@race = Race.find(params[:id])
      if @race.update(race_params)
				render json: @race
      else
      	render json: @race.errors, status: :unprocessable_entity
    	end
		end

		def destroy
			@race = Race.find(params[:id])
			@race.destroy
			render nothing: true, status: :no_content
		end

		rescue_from Mongoid::Errors::DocumentNotFound do |exception|
      #render plain: "woops: cannot find race[#{params[:id]}]", status: :not_found
      render :status=>:not_found,
        :template=>"api/races/error_msg",
        :locals=>{ :msg=>"woops: cannot find race[#{params[:id]}]" }
    end

    rescue_from ActionView::MissingTemplate do |exception|
			Rails.logger.debug exception
			render plain: "woops: we do not support that content-type[#{request.accept}])", status: :unsupported_media_type
		end

		private
\
    	# Never trust parameters from the scary internet, only allow the white list through.
    	def race_params
      	params.require(:race).permit(:name, :date, :city, :state, :swim_distance, :swim_units, :bike_distance, :bike_units, :run_distance, :run_units)
    	end
	end

end