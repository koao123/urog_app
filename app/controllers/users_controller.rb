class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)
    if
      @user.save
      log_in @user
      redirect_to users_path
    else
      render :new
    end
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
