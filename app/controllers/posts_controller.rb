class PostsController < ApplicationController

  def create
    @post=current_user.posts.new(post_params)
    @post.save
    redirect_to root_path
  end
  
  def destroy
    @post=current_user.posts.find(params[:id])
    @post.destroy
    flash[:notice]="削除しました"
    redirect_to root_path
  end
  
  private
  def post_params
    params.require(:post).permit(:title,:url)
  end
end
