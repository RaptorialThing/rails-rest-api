class Role < ApplicationRecord
  has_many :user_role
  has_many :users, :through => :user_role

  # validates :name, presence: true
end
