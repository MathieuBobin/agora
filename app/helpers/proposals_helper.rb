module ProposalsHelper
  def tweet(proposal)
    title = @proposal.title
    first_name = @proposal.user.first_name
    last_name = @proposal.user.last_name
    tweet = "#projet_agora Monsieur #{first_name} #{last_name} à proposé une initiative citoyenne dans sa ville dont le titre est : #{title}. Vous aussi ! vous pouvez proposer des initiatives citoyennes dans votre ville, cela est possible à travers notre site web ! https://agora-prd.herokuapp.com/" 
    TwitterBot.new.tweet(tweet)
  end
end