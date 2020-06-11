class UsersController < ApplicationController
  def show
    @user = User.find(permitted_user_id_param)
    @proposals = @user.proposals
  end 
  
  def edit
    @user = User.find(permitted_user_id_param)
  end
  
  private
  
  def permitted_user_id_param
    params.permit(:id).require(:id)
  end

  def pemitted_user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
