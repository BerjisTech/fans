class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    user: 'user',        # Regular user
    creator: 'creator',  # Content creator
    staff: 'staff',      # Support staff
    admin: 'admin',      # Administrator
    superadmin: 'superadmin' # Full system access
  }

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :user
  end
end
