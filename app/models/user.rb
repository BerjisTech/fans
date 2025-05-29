class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, {
    user: "user",        # Regular user
    creator: "creator",  # Content creator
    staff: "staff",      # Support staff
    admin: "admin",      # Administrator
    superadmin: "superadmin" # Full system access
  }

  scope :creators, -> { where(role: :creator) }
  scope :featured, -> { where(featured: true).order(featured_at: :desc) }
  scope :popular, -> { order(followers_count: :desc) }

  has_many :follow_relationships, 
           class_name: 'Follow',
           foreign_key: 'followed_id',
           dependent: :destroy,
           inverse_of: :followed

  has_many :followers,
           through: :follow_relationships,
           source: :follower
  has_many :inverse_follow_relationships,
            class_name: 'Follow',
            foreign_key: 'follower_id',
            dependent: :destroy,
            inverse_of: :follower
  has_many :following,
           through: :inverse_follow_relationships,
            source: :followed
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscription_plans, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one_attached :avatar
  has_many :media, dependent: :destroy
  # Validations
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # Default role for new users

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :user
  end
end
