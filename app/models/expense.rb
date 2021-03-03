class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :name, presence: true, length: { in: 2..20 }

  def group
    Group.find(group_id) if group_id
  end
end
