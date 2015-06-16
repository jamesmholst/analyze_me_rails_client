class JobsController < ApplicationController
	def index
		@jobs = Job.all.where(user_id: current_userid)
  	
  	end

  	def sentitag_chart_json
  		
  		logger.debug params[:sentitag_string]
  		sentitag_string = params[:sentitag_string]

  		sentitag_array = sentitag_string.split(":")
  		chart_data_array = []
		sentitag_array.each_index do |i|
			case i
				when 0
					chart_data_array << {"name" => "Positive", "data" => {"" => sentitag_array[i]} }	                         
				when 1
					chart_data_array << {"name" => "Negative", "data" => {"" => sentitag_array[i]} }
				when 2
					chart_data_array << {"name" => "Neutral", "data" => {"" => sentitag_array[i]} }
			end
		end

		chart_data_array 

  		respond_to do |format|
  			format.js { alert "hi"; }
  			format.json {render json: chart_data_array }
  		end

  		
  	end 

end
