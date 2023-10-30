require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "GET /api/v1/users", openapi: {
    summary: 'list all users',
    description: 'list all users ordered by default'
  } do

    it "does not return users if unauthorized" do
      get api_v1_users_path
      expect(response.status).to eq(401)
    end
  end
end

