class Ride
  attr_reader :name,
              :cost

  def initialize(roller_coaster)
    @name = roller_coaster[:name]
    @cost = roller_coaster[:cost]
  end
end
