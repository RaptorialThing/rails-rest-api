module AdminAuthorizable
  extend ActiveSupport::Concern

  included do
    rescue_from UnpermittedException, with: ->{ render(json: { error: "Forbidden" }, status: 403) }
  end

  def authorize!(current_role, action = nil)
    auth_request = AuthorizeApiRequest.new(request.headers)
    user = auth_request.call.result
    raise(UnpermittedException) if !user.roles.find{|role| role.name === current_role}

    return true
  end

  def authorize_roles!(current_roles, action = nil)
    auth_request = AuthorizeApiRequest.new(request.headers)
    user = auth_request.call.result
    #true if any given role in user_roles
    #raise if no one given role in user_roles
    raise(UnpermittedException) if (user.roles.pluck("name") & current_roles).empty?

    return true
  end
end

class UnpermittedException < StandardError; end