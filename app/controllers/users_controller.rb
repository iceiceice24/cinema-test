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
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          redirect_to @user
        end
      end
      
      def show
        @user = User.find(params[:id])
      end

    private
  
    def user_params
        params.require(:user).permit(:full_name, :email, :mobile_number, :password, :password_confirmation)
      end      
  end
  