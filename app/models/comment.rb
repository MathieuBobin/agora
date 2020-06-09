class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :proposal
  has_many :likes

  # Instance methods
  def likes_count
    self.likes.count
  end
end
