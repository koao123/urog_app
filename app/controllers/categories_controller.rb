class CategoriesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
 
  def create
    @category=current_user.categories.new(category_params)
    if @category.save
     flash[:success]="追加しました"
     redirect_to root_path
    else
     flash[:danger]="追加に失敗しました"
     redirect_to root_path
    end
  end
  
  def destroy
    @category=current_user.categories.find(params[:id])
    @category.destroy
    flash[:notice]="削除しました"
    redirect_to root_path
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
