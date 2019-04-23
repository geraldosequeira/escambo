class Site::Profile::AdsController < Site::ProfileController

  before_action :set_ad, only: [:edit, :update]

  def index
    #@ads = Ad.where(member: current_member)
    #@ads = current_member.ads
    @ads = Ad.find_by_member(current_member)
  end

  def edit
  end

  def update
    if @ad.update(params_ad)
      redirect_to site_profile_ads_path, notice: I18n.t("messages.updated_with", item: @ad.title)
    else
      render :edit, flash[:alert] = "Erros"
    end
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(params_ad)
    @ad.member = current_member

    if @ad.save
      redirect_to site_profile_ads_path, notice: I18n.t("messages.created_with", item: @ad.title)
    else
      render :new
    end
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def params_ad
    params.require(:ad).permit(:id, :title, :category_id, :price,
                               :description, :picture, :finish_date)
  end

end
