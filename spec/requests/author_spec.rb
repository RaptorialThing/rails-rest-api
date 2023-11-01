require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "GET /api/v1/authors", openapi: {
    summary: 'list all authors',
    description: 'list all authors ordered by default'
  } do

    let(:auth) {Authentication::Authentication.new}
    let(:token) {auth.generate_token}
    #remove/close this route in prod
    it "returns a list of authors" do

      get api_v1_authors_path params: {
      }, headers: {
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(200)
    end
  end
  describe "POST /api/v1/users/:user_id/relationships/roles", openapi: {
    summary: 'set user role',
    description: 'create user`s role'
  } ,  type: :request do
    let(:auth) {Authentication::Authentication.new}
    let(:token) {auth.generate_token}
    let(:user) {create(:user)}
    let(:role) {create(:author)}
      it "make user author" do

      post "/api/v1/roles/#{role.id}/relationships/users", params:
     '{"data":[{"type": "users","id":'+"#{user.id}"+'}]}', headers: {
        "Content-type": "application/vnd.api+json",
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(204)
  end

  describe "GET /api/v1/users/:user_id/relationships/roles", openapi: {
    summary: 'get user role',
    description: 'get user`s role'
  } ,  type: :request do
    let(:auth) {Authentication::Authentication.new}
    let(:token) {auth.generate_token}
    let(:role) {create(:author)}
      it "get user`s role" do

      get "/api/v1/roles/#{role.id}/relationships/users", params:
     {}, headers: {
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(200)
      end
  end


  describe "DELETE /api/v1/users/:user_id/relationships/roles", openapi: {
    summary: 'unset user role',
    description: 'remove user`s role'
  } ,  type: :request do
    let(:auth) {Authentication::Authentication.new}
    let(:token) {auth.generate_token}
    let(:user) {create(:user)}
    let(:role) {create(:author)}
      it "make user author" do

      post "/api/v1/roles/#{role.id}/relationships/users", params:
     '{"data":[{"type": "users","id":'+"#{user.id}"+'}]}', headers: {
        "Content-type": "application/vnd.api+json",
        "Authorization": "bearer #{token}"
      }

      delete "/api/v1/roles/#{role.id}/relationships/users", params:
     '{"data":[{"type": "users","id":'+"#{user.id}"+'}]}', headers: {
        "Content-type": "application/vnd.api+json",
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(204)
      end
  end


  end
end
