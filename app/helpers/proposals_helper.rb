module ProposalsHelper
  def tweet(proposal)
    TwitterBot.new.tweet(proposal.title)
  end
end
