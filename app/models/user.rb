class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_NAME_REGEX = /\A[a-zA-Z]|[0-9]|[a-zA-Z0-9]\z/.freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, uniqueness: true, length: { minimum: 3, maximum: 25 }, format: { with: VALID_NAME_REGEX }
  
  has_many :groups, dependent: :destroy
  has_many :expenses, dependent: :destroy

  def to_param
    name
  end
end
