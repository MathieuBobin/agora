class Proposal < ApplicationRecord
  after_create :admin_receipt
  belongs_to :city
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :votes

  # Instance methods
  def comments_count
    self.comments.count
  end
  
  def votes_count
    self.votes.count
  end

  def admin_receipt
    ProposalMailer.info_admin(self).deliver_now
  end
end
