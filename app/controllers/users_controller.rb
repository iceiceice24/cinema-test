class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to root_path, notice: "User registration successful!"
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:full_name, :email, :mobile_number, :password, :password_confirmation)
    end
  end
  