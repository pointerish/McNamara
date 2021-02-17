class ExpensesController < ApplicationController

  def index
    @expenses = current_user.expenses.where('group_id = NULL')
  end

  def show
    @expense = Expense.find(params[:id])
  end
end
