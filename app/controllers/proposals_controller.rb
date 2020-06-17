class ProposalsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
    @paris = City.find(1)
    @proposal_paris= @paris.proposals.where(is_online: true).sort { |p1, p2| p2.votes_count <=> p1.votes_count }.first(5)
    
    @lyon = City.find(2)
    @proposal_lyon= @lyon.proposals.where(is_online: true).sort { |p1, p2| p2.votes_count <=> p1.votes_count }.first(5)
    @user = User.all
  end
  
  def new
    @proposal = Proposal.new
    @cityid = User.find_by(id: current_user.id).city_id
    @city = City.find_by(id: @cityid).name
  end

  def create
    @proposal = Proposal.new(permitted_proposal_params)

    if @proposal.save
      flash[:success] = 'Ta proposition a bien été enregistrée !'
      redirect_to proposal_created_path
    else
      flash[:alert] = @proposal.errors.full_messages.to_sentence
      render :new 
    end
  end
  
  def show
    @proposal = Proposal.find(permitted_proposal_id_param)
    @comments = Comment.where(proposal_id: params[:id])

    if params[:tweet]
      # tweet(@proposal)
      TwitterBot.new.tweet('Hello world !')
    end
  end
  
  def destroy
    @proposal = Proposal
  end

  private
  
  def permitted_proposal_id_param
    params.permit(:id).require(:id)
  end

  def permitted_proposal_params
    params.require(:proposal).permit(:title, :purpose, :category_id, :description, :picture).merge({:user => current_user, :city => current_user.city})
  end
end 