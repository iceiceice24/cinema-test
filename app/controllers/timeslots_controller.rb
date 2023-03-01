class TimeslotsController < ApplicationController
  before_action :set_cinema
  before_action :set_timeslot, only: [:show, :edit, :update, :destroy]

  def index
    @timeslots = @cinema.timeslots.all
  end

  def show
  end

  def new
    @timeslot = @cinema.timeslots.build
  end

  def edit
  end

  def create
    @timeslot = @cinema.timeslots.build(timeslot_params)

    if @timeslot.save
      redirect_to cinema_timeslot_path(@cinema, @timeslot), notice: 'Timeslot was successfully created.'
    else
      render :new
    end
  end

  def update
    if @timeslot.update(timeslot_params)
      redirect_to cinema_timeslot_path(@cinema, @timeslot), notice: 'Timeslot was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @timeslot.destroy
    redirect_to cinema_timeslots_path(@cinema), notice: 'Timeslot was successfully destroyed.'
  end

  def book_seats
    cinema = Cinema.find(1)
    movie = Movie.find(1)
    timeslot = cinema.timeslots.find(1)

    # Attempt to book 5 seats
    if timeslot.book_seats(5)
      puts "Seats booked successfully"
    else
      puts timeslot.errors.full_messages.join(", ")
    end

    # Attempt to book 10 seats (maximum allowed)
    if timeslot.book_seats(10)
      puts "Seats booked successfully"
    else
      puts timeslot.errors.full_messages.join(", ")
    end

    # Attempt to book 11 seats (more than maximum allowed)
    if timeslot.book_seats(11)
      puts "Seats booked successfully"
    else
      puts timeslot.errors.full_messages.join(", ")
    end

  end
  

  private

  def set_cinema
    @cinema = Cinema.find_by(id: params[:cinema_id])
    unless @cinema
      flash[:error] = "Cinema not found"
      redirect_to cinemas_path
    end
  end

  def set_timeslot
    @timeslot = @cinema.timeslots.find(params[:id])
  end

  def timeslot_params
    params.require(:timeslot).permit(:start_time, :end_time, :movie_id)
  end
end
