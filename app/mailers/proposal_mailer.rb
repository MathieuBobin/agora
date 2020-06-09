class ProposalMailer < ApplicationMailer
  default from: 'zeagoraproject@gmail.com'

  def info_admin(proposal)
    @proposal = proposal
    @category = proposal.category
    @city = proposal.city
    @user = proposal.user
    @admin = 'zeagoraproject@gmail.com' 

    @url  = 'https://agora-development.herokuapp.com/' 
    mail(to: @admin, subject: 'Une proposition a été créée!') 
  end
end
