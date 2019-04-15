class Site::HomeController < SiteController

  def index
    @categories = Category.order(description: :asc)
    @ads = Ad.last_six
  end

end
