class AddCinemaToTimeslots < ActiveRecord::Migration[7.0]
  def change
    add_reference :timeslots, :cinema, null: false, foreign_key: true
  end
end
