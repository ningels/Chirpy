class ChirpSerializer < ActiveModel::Serializer

binding.pry

  attributes :body, :username, :created_at

  def username
  # `object` is the object being serialized.
  # In this case, a Chirp object
    object.user.username
  end
end
