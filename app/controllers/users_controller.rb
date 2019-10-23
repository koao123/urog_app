class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)
    if
      @user.save
      log_in @user
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @user=User.find(params[:id])
    @posts=@user.posts.paginate(page: params[:page])
  end

  def edit
  end

  def index
    @user=User.all
  end

  def show
    @user=User.find(params[:id])
  end
  def destroy
    log_out
    redirect_to root_url
  end
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
