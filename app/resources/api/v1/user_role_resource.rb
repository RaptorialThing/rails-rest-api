class Api::V1::UserRoleResource < JSONAPI::Resource
  belongs_to :user
  belongs_to :role

  attributes :user_id, :role_id
end
