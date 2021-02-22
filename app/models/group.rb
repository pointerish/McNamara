class Group < ApplicationRecord
  belongs_to :user
  has_many :expenses

  validates :name, presence: true
  validates :description, presence: true

  def to_param
    name
  end
end
