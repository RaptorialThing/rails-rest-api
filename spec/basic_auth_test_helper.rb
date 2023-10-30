shared_examples "authentication" do
    let(:created_user) {User.create(email: "nomads@nomads.com", username: "nomads",
     password: "nomads", age: 3, jti: SecureRandom.uuid)}
    let(:secret) {Rails.application.secret_key_base ? Rails.application.secret_key_base : 'Rails.application.secret_key_base';}
    let(:token) {
    exp = 7.days.from_now;
    payload = {};
    payload[:user_id] = created_user.id;
    payload[:exp] = exp.to_i;
    JWT.encode(payload, secret);

    }
    let(:create_role) {
      author = Role.create(name: "author")
      user_role = UserRole.create(user_id: created_user.id, role_id: author.id)
      user_role = UserRole.new
      user_role.user_id = created_user ? created_user.id : 1
      user_role.role_id = author.id
      user_role.save
    }

    let(:header) {
      request.header
      begin
      decoded =JWT.decode(token,secret)[0]
      HashWithIndifferentAccess.new decoded
        rescue JWT::DecodeError, JWT::ExpiredSignature
          return nil
        end
      end
    }

    describe "#authenticated?" do
      it "should be authenticated" do
        header[:user_id].should eq(created_user.id)
      end
    end
end
