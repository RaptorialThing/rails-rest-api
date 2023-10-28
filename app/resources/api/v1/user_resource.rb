class Api::V1::UserResource < JSONAPI::Resource
  attributes :username

  has_many :user_role
  has_many :roles, :through => :user_role
end
