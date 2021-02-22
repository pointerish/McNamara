class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :setup_groups

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }

  has_many :groups, dependent: :destroy
  has_many :expenses, dependent: :destroy

  protected

  def setup_groups
    Group.create(name: 'Uncategorized', description: 'Uncategorized Expenses', user_id: id, icon: 'rainbow.png')
    Group.create(name: 'Housing', description: 'Housing Expenses', user_id: id, icon: 'cottage.png')
    Group.create(name: 'Transportation', description: 'Transportation Expenses', user_id: id, icon: 'car.png')
    Group.create(name: 'Food', description: 'Food Expenses', user_id: id, icon: 'ice-cream-cone.png')
    Group.create(name: 'Utilities', description: 'Utilities Expenses', user_id: id, icon: 'utilities.png')
    Group.create(name: 'Clothing', description: 'Clothing Expenses', user_id: id, icon: 'clothes.png')
    Group.create(name: 'Medical', description: 'Medical Expenses', user_id: id, icon: 'dinosaur.png')
    Group.create(name: 'Insurance', description: 'Insurance Expenses', user_id: id, icon: 'bond.png')
    Group.create(name: 'Personal', description: 'Personal Expenses', user_id: id, icon: 'dinosaur.png')
    Group.create(name: 'Debt', description: 'Debt Expenses', user_id: id, icon: 'bond.png')
    Group.create(name: 'Savings', description: 'Savings Expenses', user_id: id, icon: 'bond.png')
    Group.create(name: 'Education', description: 'Education Expenses', user_id: id, icon: 'presentation.png')
    Group.create(name: 'Entertainment', description: 'Entertainment Expenses', user_id: id, icon: 'laugh.png')
    Group.create(name: 'General', description: 'General Expenses', user_id: id, icon: 'general.png')
  end
end
