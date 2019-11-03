class StaticPagesController < ApplicationController
  def home
      if logged_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed
      @category= current_user.categories.build
      @categories=current_user.categories.all
      end
  end
end
