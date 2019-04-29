class Site::HomeController < SiteController

  def index
    @categories = Category.linked_ad_order_by_description
    @ads = Ad.descending_order(params[:page])
  end

end
