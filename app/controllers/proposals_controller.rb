class ProposalsController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @proposal = Proposal.find(params[:id])
  end
end
