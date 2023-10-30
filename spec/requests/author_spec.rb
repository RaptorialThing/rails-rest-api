require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "GET /api/v1/authors", openapi: {
    summary: 'list all authors',
    description: 'list all authors ordered by default'
  } do

    let(:token) {Authentication::Authentication.new.generate_token}
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
    description: 'set users_roles new record with user_id, role_id'
  } ,  type: :request do
    let(:token) {Authentication::Authentication.new.generate_token}
      it "make user author" do

      post api_v1_user_relationships_roles_url(User.first.id), params: {

      }, headers: {
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(201)
    end
  end
end
