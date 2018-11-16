class User < ApplicationRecord
  attr_reader :password
  after_initialize :ensure_session_token

  def self.find_by_credentials(email_address, password)
    user = User.find_by(email_address: email_address)

    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  private
  #making sure session_token has value
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end
