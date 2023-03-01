class Cinema < ApplicationRecord
    has_many :movies
    has_many :timeslots
    has_many :users

  end
  