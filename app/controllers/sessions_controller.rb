class SessionsController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]

	def new
  	end

  	def create
  		# connect to login web service
		# Might be able to move this to a model later on
		conn = Faraday.new(:url => "#{api_url}/login")

		 # post payload as JSON instead of "www-form-urlencoded" encoding:
		 response = conn.post do |req|
		  	req.headers['Content-Type'] = 'application/json'
		  	req.body = params.slice(:email,:password).to_json #only send email and  password params
		 end

		 if response.status == 200
		 	session[:userid] = JSON.parse(response.body)["userid"]
		 	session[:user_email] = JSON.parse(response.body)["email"]
		 	redirect_to root_url
		 else
		 	# send a wrong login response
		 end
  	end

  	def destroy
  		reset_session
  		redirect_to login_url, notice: 'Logged out!'
  	end
end
