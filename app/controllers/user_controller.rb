class UserController < ApplicationController
#----------------------------------------------------------------
# class UserController
#
#  signup a new user(create) - Invoked by request:
#
#     http verb:  POST
#     url:  http://localhost:3000/signup  (not case sensitive due to gem
#                                              gem 'route_downcaser'  )
#     JSON input string example:
#       {"username": "Nardo", "name": "Leo Nardo", "password": "summer97",
#        "photo_url": "https://s-media-cache-ak0.pinimg.com/236x/28/bc/57/28bc57bc624d4086b74e2b929284afdf.webp"
#       }
#

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserExpandedSerializer
    else
      render json: @user.errors.full_messages, status: 400
    end
  end


  #  need to add the follow unfollow stuff


private

def user_params
#  params.require(:user).permit(:password, :username, photo_url)
  params.permit(:username, :name, :photo_url, :password)
end



end   #------- end class UserController
