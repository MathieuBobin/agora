class User < ApplicationRecord
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

  # Insatnce methods
  def proposals_count
    self.proposals.count
  end

  def votes_count
    self.votes.count
  end
end