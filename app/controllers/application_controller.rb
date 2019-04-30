class ApplicationController < ActionController::Base

  before_action :store_user_location!, unless: :devise_controller?
  #before_action :store_user_location!, if: :storable_location?

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  layout :layout_by_resource

  protected
    def layout_by_resource
      if devise_controller? && resource_name == :admin
        "backoffice_devise"
      elsif devise_controller? && resource_name == :member
        "site_devise"
      else
        "application"
      end
    end

    def user_not_authorized
      flash[:alert] = "Você não tem permissão."
      redirect_to request.referrer || root_path
    end

  private
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:member, request.fullpath)
    end
end
