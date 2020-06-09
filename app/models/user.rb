class User < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relations
  belongs_to :city
  has_many :proposals
  has_many :comments
  has_many :likes
  has_many :votes

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
