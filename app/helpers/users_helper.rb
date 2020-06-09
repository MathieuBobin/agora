module UsersHelper
  def current_user_proposals_count
    current_user.proposals_count
  end

  def current_user_votes_count
    current_user.votes_count
  end
end