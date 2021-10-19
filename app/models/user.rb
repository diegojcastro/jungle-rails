class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true, length: { minimum: 4 }

  before_save :before_save

  def before_save
    self.email.downcase!
  end

  def self.authenticate_with_credentials(email, password)
    strippedEmail = email.strip.downcase
    authUser = User.find_by(email: strippedEmail)&.authenticate(password) 
    authUser
  end

end
