class LikesController < ApplicationController
  
  def create
    Like.create(
      user_id: current_user.id,
      comment_id: permitted_comment_id_param
    )
    redirect_back fallback_location: root_path
  end

  def destroy
    Like.destroy(params[:id])
    redirect_back fallback_location: root_path
  end

  private

  def permitted_comment_id_param
    params.permit(:comment_id).require(:comment_id)
  end
end