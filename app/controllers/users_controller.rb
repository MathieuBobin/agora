class UsersController < ApplicationController
    before_action only: [:show]

    def index
       User.find(params[:id])
        @user = User.all
    end 

    def show
        @user = User.find(params[:id])
    end 

    def edit
        @users = User.find(params[:id])
    end

    def new 
        @user = User.new
    end

    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

end
