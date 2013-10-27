class UserSerializer < ActiveModel::Serializer
  attributes :username, :real_name, :followers, :following

  def real_name
    object.realname
  end

  def followers
    object.followers.pluck(:username)
  end

  def following
    object.followees.pluck(:username)
  end
end
