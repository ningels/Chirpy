class UserSerializer < ActiveModel::Serializer
  has_many :chirps
  attributes :username, :name, :photo_url, :token
end
