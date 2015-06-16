
# config/initializers/her.rb
Her::API.setup url: "http://54.148.22.58/JWS-Server/webapi" do |c|
  # Request
  c.use Faraday::Request::UrlEncoded

  # Response
  c.headers['Accept'] = 'application/json'
  c.headers['Content-Type'] = 'application/json'

  c.use Her::Middleware::DefaultParseJSON
  
  # Adapter
  c.use Faraday::Adapter::NetHttp
end