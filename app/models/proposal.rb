class Proposal < ApplicationRecord
  # Relations
  belongs_to :city
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :votes

  # Active storage
  # has_one_attached :picture

  # Instance methods
  def comments_count
    self.comments.count
  end
  
  def votes_count
    self.votes.count
  end
end
