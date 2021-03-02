class Group < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :nullify

  validates :name, presence: true
  validates :description, presence: true
  has_one_attached :image, dependent: :destroy
end
