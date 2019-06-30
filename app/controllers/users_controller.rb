class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc).page(params[:page]).per(40)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザー登録したよ！"
      redirect_to @user
      
    else
      flash[:danger] = "ユーザー登録失敗(´◉◞౪◟◉)"
      render :new
    end
    
  end
end

private

def user_params
  params.require(:user).permit(:name,:email,:password,:password_confirmation)
end
