class Site::HomeController < ApplicationController
  layout "site"

  def index
    @categories = Category.order(description: :asc)
    @ads = Ad.last_six
  end

end
