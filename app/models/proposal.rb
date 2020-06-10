class Proposal < ApplicationRecord
  after_create :admin_receipt
  after_create :user_receipt
  belongs_to :city
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :votes

  # Validations
  validates :title, presence: true, length: {minimum: 3, maximum: 80}
  validates :purpose, presence: true, length: {minimum: 10, maximum: 500}
  validates :description, presence: true, length: {minimum: 30, maximum: 2000}


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

  def get_vote_user(user)
    Vote.find_by(user_id: user.id, proposal_id: self.id) if user
  end

end
