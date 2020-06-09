class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :proposal
  has_many :likes
end
