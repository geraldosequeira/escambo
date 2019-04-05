class Backoffice::AdminsController < BackofficeController

  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all.order(:asc)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "Administrador cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @password = params[:admin][:password]
    @password_confirmation = params[:admin][:password_confirmation]

    if @password.blank? && @password_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    if @admin.update(admin_params)
      redirect_to backoffice_admins_path, notice: "Administrador alterado!"
    else
      render :edit
    end
  end

  def destroy
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "Adm excluido!"
    else
      render :index
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
