require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "GET /authors", openapi: {
    summary: 'list all authors',
    description: 'list all authors ordered by default'
  } do
    #remove/close this route in prod
    let(:create_user) {User.create(email: "nomads@nomads.com", username: "nomads",
     password: "nomads", age: 3, jti: SecureRandom.uuid)}
    let(:token) {
    secret = Rails.application.secret_key_base ? Rails.application.secret_key_base : 'Rails.application.secret_key_base';
    exp = 7.days.from_now;
    payload = {};
    payload[:user_id] = create_user.id;
    payload[:exp] = exp.to_i;
    JWT.encode(payload, secret);

    }
    let(:create_role) {
      author = Role.create(name: "author")
      user_role = UserRole.create(user_id: create_user.id, role_id: author.id)
      user_role = UserRole.new
      user_role.user_id = create_user ? create_user.id : 1
      user_role.role_id = author.id
      user_role.save
    }
    it "returns a list of authors" do
      create_user
      create_role
      get api_v1_authors_path params: {
      }, headers: {
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(200)
    end

    it "does not return authors if unauthorized" do
      get api_v1_users_path
      expect(response.status).to eq(401)
    end
  end
end
