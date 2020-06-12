class ProposalsController < ApplicationController
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
    @user = User.find_by(id: current_user.id)
    @cityid = User.find_by(id: current_user.id).city_id
    @proposal = Proposal.new(
      title: params[:proposal][:title],
      purpose: params[:proposal][:purpose], 
      description: params[:proposal][:description], 
      is_online: false,
      city_id: @cityid,
      category_id: params[:post][:category_id],
      user: @user
    )

    if @proposal.save
      flash[:success] = 'Ta proposition a bien été enregistrée !'
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