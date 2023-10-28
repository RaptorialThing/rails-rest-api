require 'rails_helper'

RSpec.describe "Docs", type: :request do
  describe "GET /" do
    it "returns api documentaion" do
      get root_path params: {}, headers: {}
      expect(response.status).to eq(200)
    end
  end
end
