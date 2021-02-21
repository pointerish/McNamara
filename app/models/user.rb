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
    Group.create(name: "Uncategorized", description: "Uncategorized", user_id: self.id)
    Group.create(name: "Food", description: "Food Category", user_id: self.id)
    Group.create(name: "Travel", description: "Travel Category", user_id: self.id)
    Group.create(name: "Finance", description: "Finance Category", user_id: self.id)
    Group.create(name: "General", description: "General Category", user_id: self.id)
  end
end
