class Proposal < ApplicationRecord
  belongs_to :city
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :votes
end
