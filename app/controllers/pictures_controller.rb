class PicturesController < ApplicationController
  def create
    @proposal = Proposal.find(permitted_proposal_id_param)
    @proposal.picture.attach(permitted_picture_param)
    # redirect_to @proposal
  end

  private

  def permitted_proposal_id_param
    params.permit(:proposal_id).require(:proposal_id)
  end

  def permitted_picture_param
    params.permit(:picture).require(:picture)
  end
end