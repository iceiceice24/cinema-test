class Timeslot < ApplicationRecord
    belongs_to :cinema
    belongs_to :movie
    has_many :bookings


    attribute :seats_booked, :integer, default: 0

    validates :start_time, presence: true
    validates :end_time, presence: true
    validate :check_seats_available, on: :update

    def seats_remaining
      self.seats_available - self.seats_booked
    end

    def check_seats_available
      if seats_booked > cinema.seats
        errors.add(:base, "Number of booked seats (#{seats_booked}) exceeds maximum seats available (#{cinema.seats}) for this cinema.")
      end
    end
  
    def book_seats(num_seats)
      if seats_booked + num_seats <= cinema.seats
        self.seats_booked += num_seats
        save
      else
        errors.add(:base, "Number of booked seats (#{seats_booked}) exceeds maximum seats available (#{cinema.seats}) for this cinema.")
        false
      end
    end
  end