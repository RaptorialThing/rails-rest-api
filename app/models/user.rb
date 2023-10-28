class User < ApplicationRecord
  has_secure_password

  has_many :user_roles
  has_many :roles, :through => :user_roles

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
end
