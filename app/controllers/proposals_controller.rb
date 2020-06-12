class ProposalsController < ApplicationController
  def index
    @paris = City.find(1)
    @proposal_paris= @paris.proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }.first(5)
    
    @lyon = City.find(2)
    @proposal_lyon= @lyon.proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }.first(5)
    @user = User.all
  end
  
  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(permitted_proposal_params)
    if @proposal.save!
      flash[:success] = "Proposition crée avec succès."
      redirect_to @proposal
    else
      flash[:alert] = @proposal.errors.full_messages.to_sentence
      render :new 
    end
  end
  
  def show
    @proposal = Proposal.find(permitted_proposal_id_param)
  end
  
  def destroy
    @proposal = Proposal
  end
  private
  
  def permitted_proposal_id_param
    params.permit(:id).require(:id)
  end

  def permitted_proposal_params
    params.require(:proposal).permit(:title, :purpose, :description, :city_id, :category_id, :picture).merge({:user => current_user})
  end
end