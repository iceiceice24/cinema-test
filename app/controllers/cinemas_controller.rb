class CinemasController < ApplicationController
    before_action :set_cinema, only: [:show, :edit, :update, :destroy]
    
    def index
      @cinemas = Cinema.all
      @cinema = Cinema.first  
    end
    
    def show
      @movies = @cinema.movies
    end
    
    def new
      @cinema = Cinema.new
    end
    
    def create
      @cinema = Cinema.new(cinema_params)
      
      if @cinema.save
        redirect_to @cinema, notice: "Cinema was successfully created."
      else
        render :new
      end
    end
    
    def edit
    end
    
    def update
      if @cinema.update(cinema_params)
        redirect_to @cinema, notice: "Cinema was successfully updated."
      else
        render :edit
      end
    end
    
    def destroy
      @cinema.destroy
      redirect_to cinemas_url, notice: "Cinema was successfully deleted."
    end
    
    private
    
    def set_cinema
      @cinema = Cinema.find(params[:id])
    end
    
    def cinema_params
      params.require(:cinema).permit(:name)
    end
  end
  