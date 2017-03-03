require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  def test_validates_name_presence
    user = User.new
    user.user_name = nil
    user.email = "user@gmail.com"
    refute user.save
    assert user.errors.full_messages.include? "User name can't be blank"
  end

  def test_validates_email_presence
    user = User.new
    user.user_name = "Izzybella"
    user.email = nil
    refute user.save
    assert user.errors.full_messages.include? "Email can't be blank"
  end



end
