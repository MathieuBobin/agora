class ProposalsController < ApplicationController
  def index
    @paris = City.find(1)
    @proposal_paris= @paris.proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }.first(5)
    
    @lyon = City.find(2)
    @proposal_lyon= @lyon.proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }.first(5)
    @user = User.all
  end
  
  def new
  
  end
  
  def show
    @proposal = Proposal.find(permitted_proposal_id)
  end
  
  def edit
    @proposal = Proposal.find(permitted_proposal_id)
  end
  
  def destroy
    @proposal = Proposal
  end
  private
  
  def permitted_proposal_id
    params.permit(:id).require(:id)
  end
end