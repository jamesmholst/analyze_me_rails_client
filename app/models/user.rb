class User
 
  include Her::Model
  primary_key :userid
  has_many :jobs
  has_many :smos

 	#custom_get :jobs, 

 # custom_get :popular, :unpopular
 # custom_post :login
  #login_path "/login"
end

#User.popular
# GET "/users/popular"
# => [#<User id=1>, #<User id=2>]

#User.unpopular
# GET "/users/unpopular"
# => [#<User id=3>, #<User id=4>]

#User.login(email: "user@test.com", password:"password")
# POST "/users/from_default" with `name=Maeby+Fünke`
# => #<User id=5 name="Maeby Fünke">