class Site::AdDetailController < SiteController

  def show
    @categories = Category.linked_ad_order_by_description
    @ad = Ad.friendly.find(params[:id])
  end

end
