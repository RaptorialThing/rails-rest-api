class DocsController < ApplicationController
  include ActionView::Layouts
  include ActionView::Rendering
  skip_before_action :authenticate_request

  def index
    render file: "public/swagger.html"
  end
end
