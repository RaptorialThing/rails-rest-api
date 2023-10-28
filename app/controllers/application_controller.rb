class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController
  include TokenAuthenticable
end
