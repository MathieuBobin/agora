class LikesController < ApplicationController
  
  def create
    Like.create!(
      user_id: current_user.id,
      comment_id: params[:comment_id]
    )
    redirect_back fallback_location: root_path
  end

  def destroy
    Like.destroy(params[:id])
    redirect_back fallback_location: root_path
  end

end
