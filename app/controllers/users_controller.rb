class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to root_path
  end

  def show
    @user_expenses = current_user.expenses
  end
end
