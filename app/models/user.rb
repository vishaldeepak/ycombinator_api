class User < ApplicationRecord
  acts_as_voter

  has_secure_password

  has_many :posts

  validates_presence_of :username, :password_digest
end
