class City < ApplicationRecord
  has_many :users
  has_many :proposals

  # Instance methods
  def proposals_count
    self.proposals.count
  end
end
