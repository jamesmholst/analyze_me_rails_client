class SocialMediaObjectsController < ApplicationController
  	def index
  	end

  	def twitter

  		### Need to break this out
  		connection = Faraday.new 'http://54.148.22.58/JWS-Server/webapi' do |conn|
		  	conn.request :oauth2, 'TOKEN'
		  	conn.request :json

		  	conn.response :xml,  :content_type => /\bxml$/
		  	conn.response :json, :content_type => /\bjson$/

		  	conn.use :instrumentation
		  	conn.adapter Faraday.default_adapter
		end

		response = connection.get "users/#{current_userid}/smos"
		
		smos = response.body 

		@headers = response.headers
		@found = response.headers["found"]

		@tweets = smos["socialMediaObjects"]["socialMediaObject"]

  	end
end
