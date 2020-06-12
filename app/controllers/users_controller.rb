class UsersController < ApplicationController

  def index
    @user = current_user
    @city = @user.city_id
  end

  def show
    @user = User.find(permitted_user_id_param)
    @proposals = @user.proposals
  end 
  
  def edit
    @user = User.find(permitted_user_id_param)
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
