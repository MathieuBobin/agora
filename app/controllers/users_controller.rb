class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @proposals = @user.proposals
  end 
  
  def edit
    @users = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
