class Group < ApplicationRecord
  belongs_to :User
  has_many :expenses
end
