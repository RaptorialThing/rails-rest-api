require 'rails_helper'

RSpec.describe "Register user", type: :request do
  describe "POST /auth/register", openapi: {
    summary: 'create new user',
    description: 'create new user with uniq email; return created user or error; return jwt auth token'
  } do
    it "returns created user with jwt token" do
      post auth_register_path params: {
        email: "nomads@nomads.com",
        password: "nomads",
        username: "nomads"
      }, headers: {
        "Content-type": "application/json"
        }
      expect(response.status).to eq(201)
    end
    let(:create_user) {User.create(email: "nomads@nomads.com", username: "nomads", password: "nomads", age: 3, jti: SecureRandom.uuid)}
    it "does not returns user if email duplicated" do
      create_user
      post auth_register_path params: {
        email: "nomads@nomads.com",
        password: "nomads",
        username: "nomads"
      }, headers: {
        "Content-type": "application/json"
        }
      expect(response.status).to eq(409)
    end
  end
end
