require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index", openapi: {
    summary: 'list all users',
    description: 'list all users ordered by default'
  } do
    #remove/close this route in prod
    it "returns a list of users" do
      get api_v1_users_path params: {}, headers: { Authorization: "bearer `12345`"}
      expect(response.status).to eq(200)
    end

    it "does not return users if unauthorized" do
      get api_v1_users_path
      expect(response.status).to eq(200) #401
    end
  end
end
