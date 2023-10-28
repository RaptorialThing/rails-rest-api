class Api::V1::RoleResource < JSONAPI::Resource
  attributes :name

  has_many :user_role
  has_many :users, :through => :user_role
end
