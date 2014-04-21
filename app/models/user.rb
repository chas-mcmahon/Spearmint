class User < ActiveRecord::Base

  before_validation :ensure_session_token
  validates :email, :password, presence: true
  validates :email, uniqueness: true

  #do I need this for real?
  attr_accessor :password

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(email, secret)
    @user = User.find_by(email)
    @user && User.password_digest.is_password?(secret) ? @user : nil
  end

  def ensure_session_token
    @session_token ||= User.generate_session_token
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
    #self.session_token
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password).is_password?(secret)
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

end
