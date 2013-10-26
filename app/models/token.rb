class Token < ActiveRecord::Base
  belongs_to :user

  before_validation :_generate_token, :on => :create

  def _generate_token
    self.value = SecureRandom.uuid
  end
end
