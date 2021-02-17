class Expense < ApplicationRecord
  after_validation :set_slug, only: [:create, :update]

  belongs_to :user
  belongs_to :group

  def to_param
    "#{id}-#{slug}"
  end

  private
  def set_slug
    self.slug = name.to_s.parameterize
  end 
end
