require 'rails_helper'

RSpec.describe "Roles", type: :request do
  describe "crud roles", openapi: {
    summary: 'roles',
    description: 'crud roles'
  } do

    let(:auth) {Authentication::Authentication.new}
    let(:token) {auth.generate_token}
    let(:user_id) {auth.user.id}
    let(:role_id) {auth.role.id}
    it "add new user`s role" do
      role = create(:admin)
      post api_v1_user_relationships_roles_url(user_id), params: {
        "role_id": "#{role.id}"
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

    it "should return all roles" do

      get  api_v1_roles_path, params: {},
      headers: {
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(200)
    end

    it "should create new role" do

      post api_v1_roles_path, params: '{ "data":{"type":"roles", "attributes":{"name":"rspec"}}}',
      headers: {
        "Content-type": "application/vnd.api+json",
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(201)
    end

    it "should return one role" do
      get api_v1_roles_url(role_id), params: {},
      headers: {
         "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(200)
    end

    it "should delete the role" do
      delete_role = create(:admin)
      delete "/api/v1/roles/#{delete_role.id}" , params: {},
      headers: {
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(204)
    end

  end
end
