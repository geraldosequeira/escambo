class Site::CategoryController < SiteController

  def show
    @categories = Category.linked_ad_order_by_description
    @category = Category.friendly.find(params[:id])
    @ads = Ad.where_category(@category)
  end
end
