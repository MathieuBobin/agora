class ProposalsController < ApplicationController
  def index
  end

  def show
    puts '$'*110
    p params
    puts '$'*110
    # @proposal = Proposal.find(params[:id])
  end
end
