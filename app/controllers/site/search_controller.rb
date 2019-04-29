class Site::SearchController < SiteController

  def ads
    @categories = Category.linked_ad_order_by_description
    @ads = Ad.by_search(params[:q], params[:page])
  end
end
