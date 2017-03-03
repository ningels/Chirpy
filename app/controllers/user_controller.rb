class UserController < ApplicationController

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
params.permit(:username, :name, :photo_url, :password  )
end



end