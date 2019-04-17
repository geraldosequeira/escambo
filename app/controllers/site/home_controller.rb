class Site::HomeController < SiteController

  def index
    @categories = Category.order(description: :asc)
    @ads = Ad.descending_order(6)
  end

end
