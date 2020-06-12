class Proposal < ApplicationRecord
  # Mailer config
  after_create :admin_receipt
  after_create :user_receipt
  
  # Relations
  belongs_to :city
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :votes

  # Validations
  validates :title, presence: true, length: {minimum: 3, maximum: 80}
  validates :purpose, presence: true, length: {minimum: 10, maximum: 500}
  validates :description, presence: true, length: {minimum: 30, maximum: 2000}
  # validate :must_has_atachment

  # Active storage
  has_one_attached :picture

  # Instance methods
  def comments_count
    self.comments.count
  end
  
  def votes_count
    self.votes.count
  end

  def user_receipt
    ProposalMailer.info_user(self).deliver_now
  end

  def admin_receipt
    ProposalMailer.info_admin(self).deliver_now
  end

  def vote_of(user)
    self.votes.find_by(user: user)
  end

  def general_classification
    Proposal.all.sort { |p1, p2| p2.votes_count <=> p1.votes_count }.index(self) + 1
  end

  def category_classification
    self.category.proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }.index(self) + 1
  end

  private
  
  def must_has_atachment
    errors.add(:base, "Il faut associer une image à ta proposition !") unless self.picture.attached?
  end
end