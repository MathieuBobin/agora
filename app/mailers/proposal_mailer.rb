class ProposalMailer < ApplicationMailer
  def info_admin(proposal)
    @proposal = proposal
    @user = proposal.user
    @admin = 'zeagoraproject@gmail.com' 

    @url  = 'https://agora-development.herokuapp.com/' 
    mail(to: @admin, subject: 'Une proposition a été créée!') 
  end
end
