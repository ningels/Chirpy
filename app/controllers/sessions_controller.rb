#------------------------------------------------------------
# class SessionsController
#  Invoked by request:
#     http verb:  POST
#     url:  http://localhost:3000/LOGIN   (not case sensitive due to gem
#                                              gem 'route_downcaser'  )
#     JSON input string example:
#           {"username": "Nardo", "password": "summer97" }
#     Output rendered example:
#           {"username":"Nardo",
#            "name":"Leonardo the cat",
#            "photo_url":null,
#            "token":"wknmmtFBPC9whjFT67UYZp4E"}
#
#------------------------------------------------------------

class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])&.
              authenticate(params[:password])
    if @user
      render json: @user, serializer: UserExpandedSerializer
    else
      render json: ["Invalid username password combination."], status: 401
    end
  end

end  #-------- end class SessionsController
