class Api::V1::UserRoleResource < JSONAPI::Resource
  belongs_to :user
  belongs_to :role
end
