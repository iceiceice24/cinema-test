class ApplicationController < ActionController::Base
    before_action :set_cinema
  
    private
  
    def set_cinema
      @cinema = Cinema.find(params[:cinema_id]) if params[:cinema_id].present?
    end
  end
  