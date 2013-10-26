class UserSerializer < ActiveModel::Serializer
  attributes :username, :real_name

  def real_name
    object.realname
  end
end
