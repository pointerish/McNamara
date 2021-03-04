class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :name, presence: true, length: { in: 2..20 }

  include LocalDateTimeAttrReaders
  time_zone_attr_reader :time_zone
  local_date_attr_reader :created_at, :updated_at

  def group
    Group.find(group_id) if group_id
  end
end
