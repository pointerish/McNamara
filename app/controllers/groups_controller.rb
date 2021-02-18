class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build name: params[:name]
    if @group.save!
      flash[:notice] = 'Group added!'
      redirect_to root_path
    else
      redirect_to root_path, alert: @group.errors.full_messages.join('. ').to_s
    end
  end

  def destroy
    @group = Group.find_by user_id: params[:user_id], friendee_id: current_user.id

    if @group.destroy
      redirect_to root_path, notice: 'Group deleted from records!'
    else
      redirect_to root_path, alert: @group.errors.full_messages.join('. ').to_s
    end
  end

  def show
    @group = current_user.groups.where('id = ?', params[:id])
  end
end
