class ApplicationController < ActionController::Base
    before_action :set_cinema
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?


    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end
  
    private
  
    def set_cinema
      @cinema = Cinema.find(params[:cinema_id]) if params[:cinema_id].present?
    end

    
  end
  