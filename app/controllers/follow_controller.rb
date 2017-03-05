class FollowController < ApplicationController
#------------------------------------------------------------
# class FollowController
#
#  Invoked by request:
#     http verb:  POST
#     url:  http://localhost:3000/follow
#
#     JSON input string example:
#       Assuming this token was assigned to Gandolf the Gray for example
#       {"token": "CieeQqk2hLvjV5c8W1BJT9v7", "username": "Gollum"}
#     Output rendered example:
#        ["Now following Gollum"]
#
#
#------------------------------------------------------------
before_action :require_user, only: [:create]

def create

  if current_user[:username] == f_params[:username]
        render json: ["Really???, don't be narcissistic!!"], status: 401
  else
    to_be_followed = User.find_by(username: f_params[:username])
    if to_be_followed

      @follow = current_user.followables.new
      @follow.follower_id = current_user.id
      @follow.followable_id = to_be_followed.id

      if @follow.save
        render json: ["Now following #{f_params[:username]}"], status: 200
      else
        render json: ["Unexpected error call support at 1-800-who-cares"], status: 500
      end
    else
      render json: ["Invalid username"], status: 401
    end
  end
end


private

  def f_params
    params.permit(:token, :username)
  end

end #------------ end class FollowController
