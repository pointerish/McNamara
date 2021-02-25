class ExpensesController < ApplicationController
  def index
    @expenses = current_user.expenses.includes(:group).order(created_at: :desc)
    @expenses_total = @expenses.map(&:amount).inject(:+)
  end

  def new
    @expense = Expense.new
    @groups = current_user.groups
  end

  def create
    @expense = current_user.expenses.build(expense_args)
    @expense.user_id = current_user.id
    if params[:expense].include?(:group_id)
      g_name = Group.find(params[:expense][:group_id]).name
    else
      g_name = ''
    end
    @expense.group_name = g_name
    if @expense.save!
      redirect_to expenses_path
    else
      redirect_to expenses_path, alert: @expense.errors.full_messages.join('. ').to_s
    end
  end

  def destroy
    @expense = Expense.find params[:id]

    if @expense.destroy
      redirect_back fallback_location: root_path
    else
      redirect_to root_path, alert: @expense.errors.full_messages.join('. ').to_s
    end
  end

  def show
    @expense = current_user.expenses.where('id = ?', params[:id])
  end

  def edit
    @expense = Expense.find params[:id]
    @groups = current_user.groups
  end

  def update
    @expense = Expense.find params[:id]
    @expense.group_name = Group.find(params[:expense][:group_id]).name
    if @expense.update(expense_args)
      redirect_to expenses_path
    else
      redirect_to expenses_path, alert: @expense.errors.full_messages.join('. ').to_s
    end
  end

  def uncategorized_expenses
    @uncategorized_expenses = current_user.expenses.where('group_id = 1').order(:created_at)
    @u_expenses_total = @uncategorized_expenses.map(&:amount).inject(:+)
  end

  private

  def expense_args
    params.require(:expense).permit(:name, :amount, :group_id)
  end
end
