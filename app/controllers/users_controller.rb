class UsersController < ApplicationController
  # tao ng dung moi
  def new
    @user = User.new
  end
  #dua ra thong tin cua nguoi dung
  def show
    @user = User.find(params[:id])
  end
  # luu nguoi dung moi
  def create
    @user = User.new(user_params)
    if @user.save
      #handle a successful save
      log_in @user
      flash[:success] = "Bạn đã đăng kí tài khoản thành công, mời đăng nhập"
      redirect_to login_path
    else
      render 'new'
    end
  end

  private
# yeu cau tham so dau vao cua nguoi dung phai day du
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
