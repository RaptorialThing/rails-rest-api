require 'rails_helper'

RSpec.describe "Roles", type: :request do
  describe "POST  /api/v1/users/:user_id/relationships/roles", openapi: {
    summary: 'add  user`s role',
    description: 'add new record to users_roles if not exsits already'
  } do

    let(:auth) {Authentication::Authentication.new}
    let(:token) {auth.generate_token}
    let(:user_id) {auth.user.id}
    let(:role_id) {auth.role.id}
    it "add new user`s role" do

      post api_v1_user_relationships_roles_url(user_id), params: {
        "role_id": "#{role_id}"
      }, headers: {
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(201)
    end

    it "add new user`s role with non exsits role" do

      post api_v1_user_relationships_roles_url(user_id), params: {
        "role_id": "100500"
      }, headers: {
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(422)
    end
  end
end
