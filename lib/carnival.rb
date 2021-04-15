class Carnival
  attr_reader :name,
              :rides,
              :attendees

  def initialize(name)
    @name      = name
    @rides     = []
    @attendees = []
  end

  def admit(customer)
    @attendees << customer
  end

  def add_ride(ride)
    @rides << ride
  end

  def recommend_rides(attendee)
    ride_of_interest = []
    attendee.interests.each do |ride|
      ride
      @rides.each do |coaster|
        if ride == coaster.name
          ride_of_interest << coaster
        end
      end
    end
    ride_of_interest
  end

  def attendees_by_ride_interest
    riders_for_the_day = {}
    @rides.each do |ride|
      riders_for_the_day[ride]
      @attendees.each do |attendee|
        recommend_rides(attendee).each do |coaster|
          if ride.name == coaster.name
            riders_for_the_day[ride] = [attendee]
          end
        end
      end
    end
    riders_for_the_day
    require "pry"; binding.pry
  end
end
