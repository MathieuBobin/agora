module ProposalsHelper
  def tweet(proposal)
    title = @proposal.title
    first_name = current_user.first_name
    last_name = current_user.last_name
    tweet = "#projet_agora Monsieur #{first_name} #{last_name} à proposé une initiative citoyenne dont le titre est : #{title}" 
    TwitterBot.new.tweet(tweet)
  end
end