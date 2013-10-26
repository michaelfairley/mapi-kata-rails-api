class User < ActiveRecord::Base
  validates :username, :uniqueness => {:message => "is taken"}
  validates :password, :length => {:minimum => 8, :if => -> {@raw_password}, :message => "is too short"}

  has_many :tokens

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

  def password_hash
    BCrypt::Password.new(read_attribute(:password))
  end

  def self.authenticate_with_username_and_password(username, password)
    candidate = where(:username => username).first
    if candidate && candidate.password_hash == password
      candidate
    else
      nil
    end
  end
end
