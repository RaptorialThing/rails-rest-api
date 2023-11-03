require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /api/v1/users", openapi: {
    summary: 'list all users',
    description: 'list all users ordered by default',
  } do
    #remove/close this route in prod
    it "returns a list of users" do
      user = create(:user)
      #user_author = user.roles
      role = Role.find_or_create_by(name: "author")
      unless user.roles.include? role then user.roles << role end
      token = GenerateToken.generate_token(user)
      get api_v1_users_url, params: {}, headers: { "Authorization": "bearer #{token}"}
      expect(response.status).to eq(200)
    end
  end


  describe "GET /api/v1/users", openapi: {
    summary: 'unauthorized',
    description: 'does not return users if unauthorized'
  } do
    it "does not return users if unauthorized" do
      get api_v1_users_path
      expect(response.status).to eq(401)
    end
  end

end
