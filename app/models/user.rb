class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :setup_groups
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :username, uniqueness: true, presence: true
  validates :time_zone, presence: true, time_zone: true
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }

  has_many :groups, dependent: :destroy
  has_many :expenses, dependent: :destroy

  include LocalDateTimeAttrReaders
  time_zone_attr_reader :time_zone
  local_date_attr_reader :created_at, :updated_at

  def default_groups
    %w[Uncategorized Housing Transportation
       Food Utilities Clothing Medical
       Insurance Personal Debt Savings
       Education Entertainment General]
  end

  protected

  def setup_groups
    Group.create(name: 'Housing', description: 'Housing Expenses', user_id: id, icon: 'cottage.png')
    Group.create(name: 'Transportation', description: 'Transportation Expenses', user_id: id, icon: 'car.png')
    Group.create(name: 'Food', description: 'Food Expenses', user_id: id, icon: 'ice-cream-cone.png')
    Group.create(name: 'Utilities', description: 'Utilities Expenses', user_id: id, icon: 'utilities.png')
    Group.create(name: 'Clothing', description: 'Clothing Expenses', user_id: id, icon: 'clothes.png')
    Group.create(name: 'Medical', description: 'Medical Expenses', user_id: id, icon: 'dinosaur.png')
    Group.create(name: 'Debt', description: 'Debt Expenses', user_id: id, icon: 'bond.png')
    Group.create(name: 'Savings', description: 'Savings Expenses', user_id: id, icon: 'bond.png')
    Group.create(name: 'Education', description: 'Education Expenses', user_id: id, icon: 'presentation.png')
    Group.create(name: 'Entertainment', description: 'Entertainment Expenses', user_id: id, icon: 'laugh.png')
  end
end
