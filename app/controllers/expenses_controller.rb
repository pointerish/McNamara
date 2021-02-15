class ExpensesController < ApplicationController

  def index
    redirect_to root_path
  end

  def show
    @expense = Expense.find(params[:id])
  end
end
