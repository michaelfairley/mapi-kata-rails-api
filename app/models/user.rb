class User < ActiveRecord::Base
  validates :username, :uniqueness => {:message => "is taken"}
  validates :password, :length => {:minimum => 8, :if => -> {@raw_password}, :message => "is too short"}

  def to_param
    username
  end

  def password=(raw_password)
    @raw_password = raw_password
    write_attribute(:password, BCrypt::Password.create(raw_password, :cost => 4))
  end

  def password
    @raw_password
  end
end
