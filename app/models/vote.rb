class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :proposal
  validates :proposal_id, uniqueness: {scope: :user_id}
end
