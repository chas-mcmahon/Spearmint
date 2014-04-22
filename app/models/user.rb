class User < ActiveRecord::Base

  #ask if this is right callback
  before_create :make_activation_token
  before_validation :ensure_session_token
  validates :email, :password, presence: true
  validates :email, uniqueness: true

  #should I actually need this?
  attr_accessor :password

  def self.generate_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(email, secret)
    @user = User.find_by(email)
    @user && User.password_digest.is_password?(secret) ? @user : nil
  end

  #make sure this logic is ok
  def make_activation_token
    until self.activation_token != nil && !!User.includes(self.activation_token)
      self.activation_token = User.generate_token
    end
  end

  def ensure_session_token
    self.session_token ||= User.generate_token
  end

  def reset_session_token
    self.session_token = User.generate_token
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


