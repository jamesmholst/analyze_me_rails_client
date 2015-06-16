class Job
	include Her::Model
	primary_key :jobid
	collection_path "users/:user_id/jobs"


	def sentitag_bar_chart_data
		#Need to take string and turn it into an integer
		sentitag_array = self["sentitag"].split(":")
		
		
		####  This can be used to convert values into percentages
		#	sentitag_sum = sentitag_array.inject{|sum, x| sum.to_i + x.to_i}
		#	sentitag_hash = Hash.new
		#	sentitag_array.each_index do |i|
		#		case i
		#			when 0
		#				sentitag_hash["positive"] = (sentitag_array[i].to_f/sentitag_sum*100).round(1)
		#			when 1
		#				sentitag_hash["negative"] = (sentitag_array[i].to_f/sentitag_sum*100).round(1)
		#			when 2
		#				sentitag_hash["neutral"] = (sentitag_array[i].to_f/sentitag_sum*100).round(1)
		#		end
		#	end
		#	sentitag_hash
		#########################################

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
		
	end
end