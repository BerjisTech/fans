# app/controllers/concerns/auditable.rb
module Auditable
  extend ActiveSupport::Concern

  included do
    after_action :log_action, only: [ :create, :update, :destroy ]
  end

  private

  def log_action
    return unless current_user&.staff? || current_user&.admin? || current_user&.superadmin?

    action = action_name
    AuditLog.create!(
      user: current_user,
      action: action,
      record_type: controller_name.classify,
      record_id: params[:id],
      payload: params.to_unsafe_h
    )
  end
end
