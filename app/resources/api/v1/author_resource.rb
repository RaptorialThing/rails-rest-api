class Api::V1::AuthorResource < JSONAPI::Resource
  attributes :username

  # filter :author, default: true, apply: ->(records, value, _options) {
  #   user_id = value[0]
  #   role_id = Role.where("name = ? ","author").first.id
  #   records.joins("INNER JOIN users_roles ON users.id = users_roles.user_id")
  #   .where('users_roles.role_id = ?',role_id)
  # }
end
