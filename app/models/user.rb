class User < ApplicationRecord
  validates :name, presence: true

  # TODO: 正直、ここの正規表現がわかっていない...
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

end
