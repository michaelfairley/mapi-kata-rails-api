class TokenSerializer < ActiveModel::Serializer
  attributes :token

  def token
    object.value
  end
end
