#------------------------------------------------------------
# class ChirpsController
#
#  Invoked by request:
#     http verb:  POST
#     url:  http://localhost:3000/chirps
#                             or /message
#
#     JSON input string example:
#         {"token": "9zMyzqTtSeiQhEbFSiFKxNp1", "body": "I was one cool cat"}
#     Output rendered example:
#
#
#------------------------------------------------------------

class ChirpsController < ApplicationController

  before_action :require_user, only: [:create, :timeline]

  def create
    @chirp = current_user.chirps.new(body: chirp_params[:body])

    if @chirp.save
      render json: @chirp
    else
      render json: @chirp.errors.full_messages, status: 400
    end
  end

#---------------------------------------------------------------
# http verb:  GET
# example URL from postman:
#        localhost:3000/users/?token=CieeQqk2hLvjV5c8W1BJT9v7"
  def timeline
    Chirp.timeline(current_user)
  end



#-------- private methods --------------
  private

  def chirp_params
    params.permit(:body)
  end


end
