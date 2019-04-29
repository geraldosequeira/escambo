class Site::CategoryController < SiteController

  def show
    @categories = Category.linked_ad_order_by_description
    @category = Category.friendly.find(params[:id])
    @ads = Ad.by_category(@category, params[:page])
  end
end
