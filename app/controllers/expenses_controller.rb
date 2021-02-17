class ExpensesController < ApplicationController

  def index
    @expenses = current_user.expenses.where('group_id = NULL')
  end

  def show
    @expense = current_user.expenses.where('id = ?', params[:id])
  end
end
