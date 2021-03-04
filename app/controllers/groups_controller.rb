class GroupsController < ApplicationController
  def index
    @groups = current_user.groups.with_attached_image.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_args)
    @group.icon = 'expense.png'
    if @group.save
      redirect_to groups_path
    else
      redirect_to new_group_path
      flash[:alert] = 'Check your inputs. Something is wrong!'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    redirect_to root_path if @group.destroy
  end

  def edit
    @group = Group.find params[:id]
  end

  def update
    @group = Group.find params[:id]
    if @group.update(group_args)
      redirect_to groups_path
    else
      redirect_to groups_path, alert: @group.errors.full_messages.join('. ').to_s
    end
  end

  def show
    @group_expenses = current_user.expenses.where(group_id: params[:id])
    @group = Group.find(params[:id])
  end

  private

  def group_args
    params.require(:group).permit(:name, :description, :image)
  end
end
