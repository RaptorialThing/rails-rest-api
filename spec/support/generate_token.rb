module GenerateToken
    require "rails_helper"

      def self.generate_token(user)
        secret = Rails.application.secret_key_base ? Rails.application.secret_key_base : 'Rails.application.secret_key_base'
        exp = Time.now + 60 * 60 * 24 * 7
        payload = {};
        payload[:user_id] = user.id;
        payload[:exp] = exp.to_i;
        JWT.encode(payload, secret);
      end
end
