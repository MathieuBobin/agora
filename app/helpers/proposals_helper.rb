module ProposalsHelper
  def tweet(proposal)
    title = @proposal.title
    first_name = @proposal.user.first_name
    last_name = @proposal.user.last_name
    tweet = "#projet_agora Monsieur #{first_name} #{last_name} à proposé une initiative citoyenne dont le titre est : #{title}" 
    TwitterBot.new.tweet(tweet)
  end
end