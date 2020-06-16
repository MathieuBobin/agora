class ProposalMailer < ApplicationMailer
  default from: 'zeagoraproject@gmail.com'

  def info_admin(proposal)
    @proposal = proposal
    @category = proposal.category
    @city = proposal.city
    @user = proposal.user
    @admin = 'zeagoraproject@gmail.com' 

    @url  = 'https://agora-prd.herokuapp.com/' 
    mail(to: @admin, subject: 'Une proposition a été créée!') 
  end

  def info_user(proposal)
    
    @user = proposal.user
    

    @url  = 'https://agora-prd.herokuapp.com/' 
    mail(to: @user.email, subject: 'Ta proposition a été enregistrée') 
  end

  def confirmation_proposal(proposal)
    @user = proposal.user
    @url  = 'https://agora-prd.herokuapp.com/' 
    
    
      mail(to: @user.email, subject: 'Ta proposition a été acceptée !') 
    
  end

  def send_email_after_votes(proposal)
    @proposal = proposal
    @user = proposal.user
    @votes = proposal.votes
    @url = 'https://agora-prd.herokuapp.com/'
    @url1 = 'https://www.monmandatlocal.fr/innover-pour-son-territoire/veux-inscrire-commune-demarche-de-democratie-participative-conseil-bien-faire/'
    @url2 = 'https://www.modernisation.gouv.fr/sites/default/files/fichiers-attaches/boite-outils-demarches-participation.pdf'
    @url3 = 'http://www.rij37.fr/je-monte-un-projet/comment-construire-mon-projet/'
    @url4 = 'https://enrcit.fr/qu-est-ce-qu-un-projet-citoyen/'
    @url5 = 'https://lumieresdelaville.net/citoyens-prochains-decideurs-ville/'
    @url6 = 'https://www.amf.asso.fr/documents-modalites-participation-citoyens-aux-decisions-locales/7718'
    @url7 = 'http://periurbain.cget.gouv.fr/sites/default/files/Dossier%20pre%CC%81sentation%20Formation%20Emergence%20juin%202016-Les%20Pionnie%CC%80res.pdf'

    if @proposal.votes_count == 100
    mail(to: @user.email, subject: 'Mise en relation !')
    end
    
  end
end
