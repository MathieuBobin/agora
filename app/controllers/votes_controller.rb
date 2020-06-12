class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    @city = Proposal.find(permitted_proposal_id_param).city
    if current_user.city.id != Proposal.find(params[:proposal_id]).city_id
      flash[:alert] = "Vous ne pouvez pas voter pour les propositions en dehors de votre ville! ;)"
      redirect_to @city
    else
      Vote.create!(
      user_id: current_user.id,
      proposal_id: permitted_proposal_id_param
    )
    flash[:success] = "Votre vote a bien été pris en compte! ;)"  
    redirect_back fallback_location: root_path
    end
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
end