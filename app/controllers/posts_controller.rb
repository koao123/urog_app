class PostsController < ApplicationController
  def index
    @post=current_user.tasks
  end

  def new
    @post=Post.new
  end
  
  def create
    @post=current_user.posts.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def edit
    @post=current_user.posts.find(params[:id])
  end
  
  def update
    @post=current_user.posts.find(params[:id])
    @post.update(post_params)
    flash[:notice]="投稿しました"
    redirect_to posts_path
  end
  
  def destroy
    @post=current_user.posts.find(params[:id])
    @post.destroy
    flash[:notice]="削除しました"
    redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:title,:url)
  end
end
