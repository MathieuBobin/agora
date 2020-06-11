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
    @user = User.find_by(id: current_user.id)
    @proposal = Proposal.new(
      title: params[:proposal][:title],
      purpose: params[:proposal][:purpose], 
      description: params[:proposal][:description], 
      is_online: false,
      city_id: params[:post][:city_id],
      category_id: params[:post][:category_id],
      user: @user
    )
    if @proposal.save 
      flash[:success] = "Proposition crée ;)"
    else
      render :new 
      flash[:alert] = @proposal.errors.full_messages.to_sentence
    end
  end
  
  def show
    @proposal = Proposal.find(permitted_proposal_id)
  end
  
  def edit
    @proposal = Proposal.find(permitted_proposal_id)
  end
  
  def destroy
    @proposal = Proposal
  end
  private
  
  def permitted_proposal_id
    params.permit(:id).require(:id)
  end
end