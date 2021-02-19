class ExpensesController < ApplicationController

  def index
    @expenses = current_user.expenses
  end

  def new
    @expense = Expense.new
    @groups = current_user.groups
  end

  def create
    @expense = current_user.expenses.build(expense_args)
    @expense.user_id = current_user.id
    if @expense.save!
      redirect_to expenses_path
    else
      redirect_to expenses_path, alert: @expense.errors.full_messages.join('. ').to_s
    end
  end

  def destroy
    @expense = Expense.find_by user_id: params[:user_id], friendee_id: current_user.id

    if @expense.destroy
      redirect_to root_path, notice: 'Expense deleted from records!'
    else
      redirect_to root_path, alert: @expense.errors.full_messages.join('. ').to_s
    end
  end

  def show
    @expense = current_user.expenses.where('id = ?', params[:id])
  end

  private

  def expense_args
    params.require(:expense).permit(:name, :amount, :group_id)
  end
end
