class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :name, presence: true, length: { in: 2..20 }

  def icon
    if group_id
      Group.find(group_id)
    else
      nil
    end
  end
end
