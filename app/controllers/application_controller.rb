class ApplicationController < ActionController::Base
#----------------------------------------------------------------
#       Learning notes:
#          #protect_from_forgery with: :exception
#          Had to comment out the above line, it came in because I didn't create
#          chirpy correctly. When I pasted the commmand Chris sent me in slack,
#          slack autoedited the bit that would make it api only....
#----------------------------------------------------------------
# class ApplicationController
#
# Since other controllers descend from this controller, the methods written
# here are available in all controllers.
#----------------------------------------------------------------

private

# A token representing the user is passed from this application to the
# front end application when a user signs on.  For many subsequent commands,
# this token is a requirement to proceed.  For example, the ChirpController
# has a command:
#
#           before_action :require_user, only: [:create]
#
# So if we haven't already identified a current_user and the front end
# application is providing a token with the current command, this method
# tries to find the user associated to that token.
#
# Meaning of "||=" operator:  A ||= B assigns B to A if A is nil or false


def current_user
  @current_user ||= User.find_by(token: params[:token]) if params[:token]
end


# If the front end hasn't supplied a valid token to identify the user
# that is signed on, this message is returned.

def require_user
  unless current_user
    render json: ["You need to be logged in to do this."], status: 401
  end
end


end  #------ end of class ApplicationController
