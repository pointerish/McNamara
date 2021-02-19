class Expense < ApplicationRecord
  after_validation :set_slug, only: [:create, :update]

  belongs_to :user
  belongs_to :group
end
