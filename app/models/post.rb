class Post < ApplicationRecord
  belongs_to :user

  scope :public_content, -> { where(is_public: true) }
  scope :trending, -> { order(likes_count: :desc, created_at: :desc) }

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :user_id, presence: true

  before_save :set_default_values

  private

  def set_default_values
    self.is_public ||= true
    self.likes_count ||= 0
    self.comments_count ||= 0
  end
end
