class CommentsController < ApplicationController
  
  def create
    puts "coucou voici le controler create de comment"
    puts params
    Comment.create!(
      content: params[:title],
      user: current_user,
      proposal_id: params[:proposal_id]
    )
    flash[:success] = "Votre commentaire a bien été posté !"  
    redirect_back fallback_location: root_path
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


end
