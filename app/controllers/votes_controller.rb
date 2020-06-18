class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :not_permit_to_vote_in_other_cities, only: :create
  
  def create
    puts '$'*110
    p params[:city_id]
    puts '$'*110
    @proposal = Proposal.find(permitted_proposal_id_param)
    
    vote = Vote.create(
      user: current_user,
      proposal: @proposal
    )
    
    # flash[:success] = "Votre vote a bien été pris en compte !"  
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
  end
  
  def destroy
    Vote.destroy(permitted_vote_id_param)

    # For AJAX use
    @proposal = Proposal.find(permitted_proposal_id_param)
    @city = @proposal.city
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
  end
  
  private
  
  def permitted_proposal_id_param
    params.permit(:proposal_id).require(:proposal_id)
  end
  
  def permitted_vote_id_param
    params.permit(:id).require(:id)
  end
  
  def not_permit_to_vote_in_other_cities
    proposal = Proposal.find(permitted_proposal_id_param)
    unless proposal.city.id == current_user.city.id
      # flash[:alert] = "Vous ne pouvez pas voter pour les propositions en dehors de votre ville !"
      redirect_back fallback_location: root_path
    end
  end
end