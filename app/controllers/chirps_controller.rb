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

  before_action :require_user, only: [:create]

  def create
    @chirp = current_user.chirps.new(body: chirp_params[:body])

    if @chirp.save
      render json: @chirp
    else
      render json: @chirp.errors.full_messages, status: 400
    end
  end

  private

  def chirp_params
    params.permit(:body)
  end


end
