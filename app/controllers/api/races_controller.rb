module Api
	class RacesController < Api::BaseController
		#api/races
		def index
			if !request.accept || request.accept == "*/*"
				render plain: "/api/races"
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
				render plain: :nothing, status: :ok
			else
				#real implementation
			end
		end
	end

end