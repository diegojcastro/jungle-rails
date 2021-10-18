class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 4 }



end
