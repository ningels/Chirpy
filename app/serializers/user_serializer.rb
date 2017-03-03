class UserSerializer < ActiveModel::Serializer
  attributes :username, :name, :photo_url
end
