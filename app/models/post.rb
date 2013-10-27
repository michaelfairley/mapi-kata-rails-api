class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "User", :foreign_key => "user_id", :inverse_of => :posts

  def self.page(after)
    scope = limit(50).order("id DESC").includes(:author)
    scope = scope.where("id < ?", after)  if after
    scope
  end

  def self.timeline(user)
    author_ids = user.followees.pluck(:id)
    where(:user_id => author_ids)
  end
end
