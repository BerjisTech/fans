# app/controllers/admin/user_roles_controller.rb
class Admin::UserRolesController < Admin::BaseController
  before_action :set_user, only: [:edit, :update]
  before_action :require_superadmin!, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "User role updated successfully."
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role)
  end

  def require_superadmin!
    unless current_user.superadmin?
      redirect_to admin_dashboard_path, alert: "Only superadmins can modify roles."
    end
  end
end