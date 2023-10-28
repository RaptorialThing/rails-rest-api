require 'rails_helper'

RSpec.describe "Login user", type: :request do
  describe "POST /auth/login", openapi: {
    summary: 'login as user',
    description: 'login as existing user by email'
  } do
    let(:create_user) {User.create(email: "nomads@nomads.com", username: "nomads", password: "nomads", age: 3, jti: SecureRandom.uuid)}
    it "returns logged user with jwt token" do
      create_user
      post auth_login_path params: {
        email: "nomads@nomads.com",
        password: "nomads"
      }, headers: {
        "Content-type": "application/json"
        }
      expect(response.status).to eq(200)
    end
  end
end
