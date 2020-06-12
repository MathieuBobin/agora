class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    Vote.create!(
      user_id: current_user.id,
      proposal_id: permitted_proposal_id_param
    )
    
    @city = Proposal.find(permitted_proposal_id_param).city

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
end