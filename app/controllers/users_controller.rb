class UsersController < ApplicationController
  def show
    @user = current_user
   
    @proposals = @user.proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }
  end 
  
  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(pemitted_user_params)
      flash[:success] = "Ton profil a été mis-à-jour."
      redirect_to @user
    else
      render :edit
    end
  end
  
  private
  
  def permitted_user_id_param
    params.permit(:id).require(:id)
  end

  def pemitted_user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end