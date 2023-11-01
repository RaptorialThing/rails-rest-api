class User < ApplicationRecord
  has_secure_password

  has_many :user_role
  has_many :roles, :through => :user_role

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
end
