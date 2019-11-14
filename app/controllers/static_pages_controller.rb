class StaticPagesController < ApplicationController
  def home
      if logged_in?
      @post  = current_user.posts.build
      @category= current_user.categories.build
      @categories=current_user.categories.all
      @category_null_posts=current_user.posts.where(category_id: nil)
      end
  end
end
