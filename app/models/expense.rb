class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :name, presence: true, length: { in: 2..20 }

  def icon
    Group.find(group_id).icon
  end
end
