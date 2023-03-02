class UsersController < ApplicationController
    def index
        @cinema = Cinema.find(params[:cinema_id])
        @users = User.all
    end
    
    def new
      @user = User.new
    end
  
    def create
        @user = User.new(user_params)
      
        if @user.save
          redirect_to cinema_movies_path, notice: 'User was successfully created.'
        else
          render :new
        end
      end
      
    private
  
    def user_params
        params.require(:user).permit(:full_name, :email, :mobile_number, :password, :password_confirmation)
      end      
  end
  