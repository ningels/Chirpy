class User < ApplicationRecord
  has_secure_password
  has_secure_token :token

  validates  :username, :name,   presence: true

end
