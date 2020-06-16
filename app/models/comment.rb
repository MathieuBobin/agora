class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :proposal
  belongs_to :comment
  has_many :comments
  has_many :likes
  

  # Validations
  validates :content, length: {minimum: 0, maximum: 300}

  # Instance methods
  def likes_count
    self.likes.count
  end
end
