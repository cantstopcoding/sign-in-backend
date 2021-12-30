class User < ApplicationRecord
  has_secure_password

  validates :email, :username, :name, :password, presence: true
  validates :email, :username, uniqueness: true
end
