class Site::AdDetailController < SiteController

  def show
    @ad = Ad.friendly.find(params[:id])
  end

end
