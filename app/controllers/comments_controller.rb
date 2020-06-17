class CommentsController < ApplicationController
  
  def create
    @proposal = Proposal.find(permitted_proposal_id_param)

    if params[:comment_id]
      @comment = Comment.new(
        content: params[:content],
        user: current_user,
        comment_id: permitted_comment_id_param
      )

      if @comment.save
        flash[:success] = "Votre commentaire a bien été posté !"
        redirect_back fallback_location: root_path
      else
        flash[:success] = @comment.errors.full_messages.to_sentence
        redirect_to @proposal
      end
    else
      @comment = Comment.new(
        content: params[:content],
        user: current_user,
        proposal_id: permitted_proposal_id_param
      )
      if @comment.save
        flash[:success] = "Votre commentaire a bien été posté !"
        redirect_back fallback_location: root_path
      else
        flash[:success] = @comment.errors.full_messages.to_sentence
        redirect_to @proposal
      end
    end
  end

  def destroy
    Comment.destroy(params[:id])
    flash[:success] = "Votre commentaire a bien été supprimé !"  
    redirect_back fallback_location: root_path
  end

  private

  def permitted_proposal_id_param
    params.permit(:proposal_id).require(:proposal_id)
  end
  
  def permitted_comment_id_param
    params.permit(:comment_id).require(:comment_id)
  end
end