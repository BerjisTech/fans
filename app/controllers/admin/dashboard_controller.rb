class Admin::DashboardController < ApplicationController
  def index
    @users = User.where(role: [ :user, :creator ]).order(created_at: :desc).limit(10)
    @recent_posts = Post.order(created_at: :desc).limit(10)
    @reports = Report.unresolved.order(created_at: :desc).limit(5)
  end
end
