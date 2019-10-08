class PostsController < ApplicationController
  def index
    @post=Post.all
  end

  def new
    @post=Post.new
  end
  
  def create
    @post=Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def edit
    @post=Post.find(params[:id])
  end
  
  def update
    @post=Post.find(params[:id])
    @post.update(post_params)
    flash[:notice]="投稿しました"
    redirect_to posts_path
  end
  
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    flash[:notice]="削除しました"
    redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:title,:url)
  end
end
