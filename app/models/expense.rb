class Expense < ApplicationRecord
  attr_reader :icon

  belongs_to :user
  belongs_to :group

  def icon
    Group.find(group_id).icon
  end
end
