class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user_expenses = current_user.expenses
  end
end
