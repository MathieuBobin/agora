class PicturesController < ApplicationController
  def create
    @proposal = Proposal.find(params[:proposal_id])
    @proposal.picture.attach(params[:picture])
    redirect_to @proposal
  end
end
