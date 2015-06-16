module SocialMediaObjectsHelper

	def tweet_timestamp_formatter(timestamp_string)
		time_obj = Time.parse(timestamp_string)
		time_obj.strftime("%b %d @ %I:%M %P ")
	end 

end
