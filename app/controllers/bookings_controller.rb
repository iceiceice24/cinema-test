class BookingsController < ApplicationController

    def create
        @cinema = Cinema.find(params[:cinema_id])
        @timeslot = @cinema.timeslots.find(params[:timeslot_id])
        @booking = @timeslot.bookings.new(user_id: current_user.id)
      
        if @booking.save
          redirect_to @cinema, notice: "Seats booked successfully."
        else
          redirect_to @cinema, alert: "Failed to book seats."
        end
      end
      
      def destroy
        @booking = Booking.find(params[:id])
        @cinema = @booking.timeslot.cinema
      
        if @booking.destroy
          redirect_to @cinema, notice: "Booking canceled successfully."
        else
          redirect_to @cinema, alert: "Failed to cancel booking."
        end
      end
      
end
