module TokenAuthenticable
	extend ActiveSupport::Concern

  include JsonWebToken

	included do
		before_action :authenticate_request

		attr_reader :current_user

		rescue_from UnauthorizedException, with: ->{ render(json: {error: "Unauthorized"}, status: 401) }
	end

	private

	def authenticate_request
      header = request.headers["Authorization"]
      header = header.split(" ").last if header
      raise(UnauthorizedException) unless header
      decoded = jwt_decode(header)
      @current_user =User.find(decoded[:user_id])
			raise(UnauthorizedException) unless @current_user
	end
end


class UnauthorizedException < StandardError; end
