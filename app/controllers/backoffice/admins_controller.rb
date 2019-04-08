class Backoffice::AdminsController < BackofficeController

  before_action :set_admin, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: :new
  after_action :verify_policy_scoped, only: :index

  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
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
    @password = params[:admin][:password]
    @password_confirmation = params[:admin][:password_confirmation]

    if @password.blank? && @password_confirmations.blank?
      params[:admin].extract!(:password, :password_confirmation)
      #params[:admin].delete(:password_confirmation)
    end

    params.require(:admin).permit(:email, :name, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
