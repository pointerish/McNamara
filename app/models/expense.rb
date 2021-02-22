class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def icon
    Group.find(group_id).icon
  end
end
