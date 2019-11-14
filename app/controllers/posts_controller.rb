class PostsController < ApplicationController

  def create
    @post=current_user.posts.build(post_params)
    if @post.save
     flash[:success]="追加しました"
     redirect_to root_path
    else
     flash[:danger]="追加に失敗しました"
     redirect_to root_path
    end
  end
  
  def destroy
    @post=current_user.posts.find(params[:id])
    @post.destroy
    flash[:notice]="削除しました"
    redirect_to root_path
  end
  
  private
  def post_params
    params.require(:post).permit(:title,:url,:user_id,:category_id)
  end
end
