class UserExpandedSerializer < ActiveModel::Serializer
  attributes :username, :name, :photo_url, :token
end
