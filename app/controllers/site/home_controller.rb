class Site::HomeController < ApplicationController
  layout "site"

  def index
    @categories = Category.all.order(:asc)
  end

end
