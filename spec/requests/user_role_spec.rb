require 'rails_helper'

RSpec.describe "UserRole", type: :request do
  describe "user role", openapi: {
    summary: 'user role',
    description: 'user role'
  } do

    let(:auth) {Authentication::Authentication.new}
    let(:token) {auth.generate_token}
    let(:user_id) {auth.user.id}
    let(:role_id) {auth.role.id}

    it "should return all users`s roles" do

      get  api_v1_user_related_roles_url(user_id), params: {},
      headers: {
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(200)
    end
  end
end
