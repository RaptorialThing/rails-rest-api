require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /api/v1/users", openapi: {
    summary: 'list all users if user has role admin or author',
    description: 'list all users if user has role admin or author',
  } do
    #remove/close this route in prod
    let(:author) {create(:author)}
    let(:make_user_author) {auth.user.user_role.find_or_create_by!(role_id: author.id)}
    let(:auth) {Authentication::Authentication.new}
    let(:token) {auth.generate_token}
    it "returns list all users if user has role admin or author" do
      make_user_author
      get api_v1_users_url, params: {}, headers: { "Authorization": "bearer #{token}"}
      expect(response.status).to eq(200)
    end
  end


  describe "GET /api/v1/users", openapi: {
    summary: 'unauthorized',
    description: 'does not return users if user does not have role admin or author'
  } do
    let(:auth) {Authentication::Authentication.new}
    let(:token) {auth.generate_token}
    it "does not return users if user does not have role admin or author" do
      get api_v1_users_path, params: {}, headers: { "Authorization": "bearer #{token}"}
      expect(response.status).to eq(403)
    end
  end

end

