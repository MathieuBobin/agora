class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :not_permit_to_vote_in_other_cities, only: :create
  
  def create
    Vote.create!(
      user: current_user,
      proposal_id: permitted_proposal_id_param
    )
    
    flash[:success] = "Votre vote a bien été pris en compte !"  
    redirect_back fallback_location: root_path
  end
  
  def destroy
    Vote.destroy(permitted_vote_id_param)
    
    @city = Proposal.find(params[:proposal_id]).city
    redirect_back fallback_location: root_path
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
      flash[:alert] = "Vous ne pouvez pas voter pour les propositions en dehors de votre ville !"
      redirect_back fallback_location: root_path
    end
  end
end