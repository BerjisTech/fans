class HomeController < ApplicationController
  def index
    if user_signed_in?
      # For logged-in users, show featured content or dashboard
      @featured_creators = User.creators.featured.limit(4)
      @trending_posts = Post.public_content.trending.limit(6)
    else
      # For guests, show landing page with signup options
      @popular_creators = User.creators.popular.limit(3)
    end
  end
end
