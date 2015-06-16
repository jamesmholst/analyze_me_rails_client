class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # require that a user be defined for all pages, put in exception in the sessions controller
  before_action :require_login
 

  helper_method :current_user
  helper_method :api_url
  
  private
  	def current_userid
  	   	session[:userid]
  	end
    
     def require_login
      	if current_userid.present?
      		true
      	else
      		flash[:error] = "You must be logged in to access this section"
        		redirect_to  login_url # halts request cycle
      	end
      end

      def api_url
        Rails.configuration.api_url
      end 

      def api_connection
        ### Not being used, but may be useful for getting a connection object

          ### Need to break this out
        connection = Faraday.new api_url do |conn|
          conn.request :json

          conn.response :xml,  :content_type => /\bxml$/
          conn.response :json, :content_type => /\bjson$/

          conn.use :instrumentation
          conn.adapter Faraday.default_adapter
        end

         # response = connection.get "users/#{current_userid}/jobs"
      end 

end
