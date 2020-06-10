class ProposalsController < ApplicationController
  def index
  end

  def show
    @proposal = Proposal.find(params[:id])
  end
end
