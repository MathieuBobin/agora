class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    
    puts params[:proposal_id]
    
    Vote.create!(
      user_id: current_user.id,
      proposal_id: params[:proposal_id]
    )
    @city = Proposal.find(params[:proposal_id]).city

    redirect_to @city

  end

  def destroy
    Vote.destroy(params[:id])
    @city = Proposal.find(params[:proposal_id]).city
    redirect_to @city
  end

  
end
