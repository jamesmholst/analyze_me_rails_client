Here is a basic Rails app which connects to the RESTful web service.

So here's a little guide of what's what:

#####################
###  Connection
#####################
Using the "Her" gem, which lets you interact with web services as if it were a database.
See the configuration in: ./config/initializers/her.rb


I ran into a few hiccups using "Her" and am using the "Faraday" gem as a workaround. 
"Her" is built on "Faraday", so no biggie.  "Faraday" let's you create vanilla connections, 
and is flexible as long as you know how to configure it.

The two cases (so far) that are using "Faraday" are:
1) the login action, see sessions_controller.rb 
2) getting the response headers in the twitter list, which are needed to do pagination.  See
the "twitter" action in social_media_objects_controller.rb to see this in action.

I think with a little bit of tinkering, "Her" could be used exclusively, but it's hard to say for sure.

There is a global config variable defined in ./config/environments/development.rb 
config.api_url  = 'http://54.148.22.58/JWS-Server/webapi'

This is good to have the base url defined in one place and to be able to change it based on the environment.


Also, there is an api_connection method in application_controller.rb.  This isn't being used, but it might be a good
place to create a generic Faraday connection to the web service.

#####################################
## UI
####################################
Using the "Flatly" bootstrap theme.  All the theme info is in the bootswatch-rails gem, so it's real easy to change.
If you want to change up all the colors, just go to application.scss and replace "flatly" with another bootswatch theme name. 
These are the 2 lines:

@import "bootswatch/flatly/variables";
@import "bootswatch/flatly/bootswatch";

#####################################
# Charts
#####################################
Using the Chartkick gem, which is an interface to google charts.  The api is imported 
at the top of application.html.erb:
<%= javascript_include_tag "//www.google.com/jsapi", "chartkick" %>

Chartkick is also used in pure javascript form (coffeescript form) in jobs.coffee


