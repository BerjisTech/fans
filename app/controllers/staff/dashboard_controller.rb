class Staff::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_staff!

  def index
    @reports = Report.unresolved.order(created_at: :desc)
    @recent_messages = Message.reported.order(created_at: :desc).limit(10)
  end

  private

  def require_staff!
    unless current_user.staff? || current_user.admin? || current_user.superadmin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
