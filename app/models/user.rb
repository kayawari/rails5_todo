class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true

  # TODO: 正直、ここの正規表現がわかっていない...
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
