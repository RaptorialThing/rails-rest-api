# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(email: "nomad@nomad.com", username: "nomads", password: "nomads", age: 3, jti: SecureRandom.uuid)
admin = Role.create(name: "admin")
author = Role.create(name: "author")
user_role = UserRole.create(user_id: user.id, role_id: admin.id)
user_role = UserRole.new
user_role.user_id = user ? user.id : 1
user_role.role_id = author.id
user_role.save
