class PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id, :author

  def author
    object.author.username
  end
end
