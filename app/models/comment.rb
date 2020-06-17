class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :proposal, optional: true
  belongs_to :comment, optional: true
  has_many :comments
  has_many :likes
  

  # Validations
  validates :content, presence: true, length: {minimum: 0, maximum: 2000}

  # Instance methods
  def likes_count
    self.likes.count
  end
end
