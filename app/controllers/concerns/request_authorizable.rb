module RequestAuthorizable
  extend ActiveSupport::Concern

  included do
    rescue_from UnpermittedException, with: ->{ render(json: { error: "Forbidden" }, status: 403) }
  end

  def authorize!(allowed_role, action = nil)
    raise(UnpermittedException) if !@current_user.roles.find{|role| role.name === allowed_role}
    return true
  end

  def authorize_roles!(allowed_roles, action = nil)
    #true if any given role in user_roles
    #raise if no one given role in user_roles
    raise(UnpermittedException) if (User.includes("roles").find(@current_user.id).roles.pluck("name") & allowed_roles).empty?
    return true
  end
end

class UnpermittedException < StandardError; end
