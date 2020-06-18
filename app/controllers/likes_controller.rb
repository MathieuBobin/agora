class LikesController < ApplicationController
  
  def create
    like = Like.create(
      user_id: current_user.id,
      comment_id: permitted_comment_id_param
    )

    # For AJAX use
    # Get proposal which comment has been liked
    @proposal = Proposal.find(permitted_proposal_id_param)
    # Get comments of proposel liked and sort them in alphabetical order
    @comments = @proposal.comments.sort { |p1, p2| p2.likes_count <=> p1.likes_count }
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
  end
  
  def destroy
    Like.destroy(permitted_like_id_param)
    
    # For AJAX use
    # Get proposal which comment has been liked
    @proposal = Proposal.find(permitted_proposal_id_param)
    # Get comments of proposel liked and sort them in alphabetical order
    @comments = @proposal.comments.sort { |p1, p2| p2.likes_count <=> p1.likes_count }
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
  end

  private

  def permitted_proposal_id_param
    params.permit(:proposal_id).require(:proposal_id)
  end

  def permitted_comment_id_param
    params.permit(:comment_id).require(:comment_id)
  end

  def permitted_like_id_param
    params.permit(:id).require(:id)
  end
end