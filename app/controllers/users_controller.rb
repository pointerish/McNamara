class UsersController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    @user_expenses = current_user.expenses
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_args)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_args
    params.require(:user).permit(:username, :email, :password)
  end
end
