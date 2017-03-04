class ApplicationController < ActionController::Base
#      protect_from_forgery with: :exception
#      this "protect..." bit came in because I didn't create chirpy correctly
#      when I pasted what Chris sent me in slack it autoedited
#      the bit that would make it api only....
#----------------------------------------------------------------
## Since every other controller descends from ApplicationController, methods
# written here are available in all the controllers.  
#


private

def current_user
  @current_user ||= User.find_by(token: params[:token]) if params[:token]
end

def require_user
  unless current_user
    render json: ["You need to be logged in to do this."], status: 401
  end
end




end
