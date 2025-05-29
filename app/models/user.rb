class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    user: "user",        # Regular user
    creator: "creator",  # Content creator
    staff: "staff",      # Support staff
    admin: "admin",      # Administrator
    superadmin: "superadmin" # Full system access
  }

  scope :creators, -> { where(role: :creator) }
  scope :featured, -> { where(featured: true).order(featured_at: :desc) }
  scope :popular, -> { order(followers_count: :desc) }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followers, class_name: "User", foreign_key: "followed_id"
  has_many :following, class_name: "User", foreign_key: "follower_id"

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # Default role for new users

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :user
  end
end
