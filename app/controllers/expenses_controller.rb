class ExpensesController < ApplicationController

  def index
    @expenses = current_user.expenses.where('group_id = NULL')
  end

  def new
    @expense = Expense.new
    @groups = current_user.groups ? current_user.groups : [0]
  end

  def create
    @expense = current_user.expenses.build(expense_args)
    if @expense.save!
      flash[:notice] = 'Expense added!'
      redirect_to root_path
    else
      redirect_to root_path, alert: @expense.errors.full_messages.join('. ').to_s
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
