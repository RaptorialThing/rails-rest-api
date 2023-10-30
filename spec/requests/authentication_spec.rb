RSpec.describe "Authentication" do
    let(:token) {Authentication::Authentication.new.generate_token}
    it "#authenticated?" do
      get api_v1_authors_path params: {
      }, headers: {
        "Authorization": "bearer #{token}"
      }
      expect(response.status).to eq(200)
    end

end
