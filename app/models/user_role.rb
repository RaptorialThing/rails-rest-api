class UserRole < ApplicationRecord
  self.table_name = "users_roles"
  belongs_to :user
  belongs_to :role

  validates :user_id, presence: true
  validates :role_id, presence: true
end
