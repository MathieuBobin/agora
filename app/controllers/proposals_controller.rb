class ProposalsController < ApplicationController
  def index
    @paris = City.find(1)
    @proposal_paris= @paris.proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }.first(5)

    @lyon = City.find(2)
    @proposal_lyon= @lyon.proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }.first(5)
    @user = User.all
  end

  def show
    @proposal = Proposal.find(params[:id])
  end
end