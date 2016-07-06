module Api
	class RacersController < Api::BaseController

		#/api/racers
		def index
			if !request.accept || request.accept == "*/*"
				render plain: "/api/racers"
			else
				#real implementation ...
			end
		end

		#api/racers/:id
		def show
			if !request.accept || request.accept == "*/*"
				render plain: "/api/racers/#{params[:id]}"
			else
				#real implementation ...
			end
		end
	end
end