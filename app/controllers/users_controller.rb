class UsersController < ApplicationController
  def show
    @user = User.find(permitted_user_id_param)
    @proposals = @user.proposals
  end 
  
  def edit
    @user = User.find(permitted_user_id_param)
    
  end
  
  def update
    puts "*****************************"
    "test"
    @user = current_user
    if @user.update(permitted_user_id_param)
      flash[:success] = "Ton profil a été mis-à-jour."
      redirect_to mon_profil_path
    else
      render editer_mon_profil_path
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
