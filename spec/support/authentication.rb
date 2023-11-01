module Authentication
    require "rails_helper"
    class Authentication
      attr_accessor :user, :token, :role
      def initialize
        created_user
        create_role
      end
      def created_user
        @user = User.find_by(email:"nomads@nomads.com")
        unless @user then
        @user = User.create!(email: "nomads@nomads.com", username: "nomads",
                    password: "nomads",
                    age: 3, jti: SecureRandom.uuid)
        end
      end
      def secret
        Rails.application.secret_key_base ? Rails.application.secret_key_base : 'Rails.application.secret_key_base'
      end
      def generate_token
      exp = Time.now + 60 * 60 * 24 * 7
      payload = {};
      payload[:user_id] = @user.id;
      payload[:exp] = exp.to_i;
      @token = JWT.encode(payload, secret);

      end
      def create_role
        user = Role.create!(name: "user")
        @role = UserRole.create!(user_id: @user.id, role_id: user.id)

      end
    end
end
