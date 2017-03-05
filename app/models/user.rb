class User < ApplicationRecord
  has_secure_password
  has_secure_token :token

  validates  :username, :name,   presence: true
  validates  :username, uniqueness: true

  has_many :chirps

  has_many :followers,   class_name: "Follow", foreign_key: "follower_id"
  has_many :followables, class_name: "Follow", foreign_key: "followable_id"

end
