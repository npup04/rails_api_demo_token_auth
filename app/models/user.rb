class User < ActiveRecord::Base
  #this gives us the authenticate method for a @user_instance
  has_secure_password

  before_create :generate_token

  def generate_token
    return if token.present?
    begin
      self.token = SecureRandom.uuid.gsub(/\-/,'')
    end while self.class.exists?(token: token)

  end

end
