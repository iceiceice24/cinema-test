class MoviesController < ApplicationController
    before_action :set_cinema
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
  
   
    def index
      @movies = @cinema.movies
    end
  
   
    def show
      @movie = Movie.find(params[:id])
      @timeslots = @movie.timeslots
    end
    
  
    def new
        @cinema = Cinema.find(params[:cinema_id])
        @movie = @cinema.movies.build
      end
      
  
    
    def edit
    end
  
    
    def create
      @movie = @cinema.movies.new(movie_params)
  
      if @movie.save
        redirect_to cinema_movie_path(@cinema, @movie), notice: 'Movie was successfully created.'
      else
        render :new
      end
    end
  

    def update
      if @movie.update(movie_params)
        redirect_to cinema_movie_path(@cinema, @movie), notice: 'Movie was successfully updated.'
      else
        render :edit
      end
    end
  
 
    def destroy
      @movie.destroy
      redirect_to cinema_movies_path(@cinema), notice: 'Movie was successfully destroyed.'
    end
  
    private
  

    def set_cinema
      @cinema = Cinema.find(params[:cinema_id])
    end
  
    def set_movie
      @movie = @cinema.movies.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def movie_params
      params.require(:movie).permit(:title, :description)
    end
  end
  