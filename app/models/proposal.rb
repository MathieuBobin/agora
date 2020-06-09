class Proposal < ApplicationRecord
  belongs_to :city
  belongs_to :category
  has_many :comments
  has_many :votes
end
