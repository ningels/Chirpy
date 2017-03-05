class UnfollowController < ApplicationController
#------------------------------------------------------------
# class UnfollowController
#
#  Invoked by request:
#     http verb:  POST
#     url:  http://localhost:3000/unfollow
#
#     JSON input string example:
#       Assuming this token was assigned to Gandolf the Gray for example
#       {"token": "CieeQqk2hLvjV5c8W1BJT9v7", "username": "Gollum"}
#     Output rendered example:
#        ["Now following Gollum"]
#

#------------------------------------------------------------
   before_action :require_user, only: [:create]

  def delete

    user_to_unfollow = User.find_by(username: u_params[:username])
    follow_record = Follow.find_by(follower_id:    current_user.id,
                                followable_id:  user_to_unfollow.id)

    # @follow.follower_id = current_user.id
    # @follow.followable_id = to_be_followed.id

binding.pry
    if follow_record
      follow_record.delete
      render json: ["Now unfollowing #{u_params[:username]}"], status: 200
    else
      render json: ["No updates, didn't find that you were following them"], status: 401
    end
  end


  private

  def u_params
    params.permit(:token, :username)
  end

end     #------------ end class UnFollowController
